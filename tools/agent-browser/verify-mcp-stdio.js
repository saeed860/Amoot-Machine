#!/usr/bin/env node
'use strict';

const { spawn } = require('node:child_process');
const readline = require('node:readline');
const path = require('node:path');

const launcher = process.argv[2] || path.join(process.env.HOME, 'amoot-agent-browser', 'run-mcp.sh');
const child = spawn('bash', [launcher], {
  env: process.env,
  stdio: ['pipe', 'pipe', 'pipe'],
});

let stderr = '';
child.stderr.setEncoding('utf8');
child.stderr.on('data', chunk => { stderr += chunk; });

const rl = readline.createInterface({ input: child.stdout });
const pending = new Map();
let nextId = 1;
let stdoutNoise = '';

rl.on('line', line => {
  let message;
  try {
    message = JSON.parse(line);
  } catch {
    stdoutNoise += line + '\n';
    return;
  }
  if (message.id !== undefined && pending.has(message.id)) {
    const { resolve, reject, timer } = pending.get(message.id);
    clearTimeout(timer);
    pending.delete(message.id);
    if (message.error) reject(new Error(JSON.stringify(message.error)));
    else resolve(message.result);
  }
});

function request(method, params = {}) {
  const id = nextId++;
  return new Promise((resolve, reject) => {
    const timer = setTimeout(() => {
      pending.delete(id);
      reject(new Error('Timed out waiting for MCP ' + method));
    }, 20000);
    pending.set(id, { resolve, reject, timer });
    child.stdin.write(JSON.stringify({
      jsonrpc: '2.0',
      id,
      method,
      params,
    }) + '\n');
  });
}

function notify(method, params = {}) {
  child.stdin.write(JSON.stringify({ jsonrpc: '2.0', method, params }) + '\n');
}

(async () => {
  try {
    const initialized = await request('initialize', {
      protocolVersion: '2025-11-25',
      capabilities: {},
      clientInfo: { name: 'amoot-mcp-stdio-check', version: '1.0.0' },
    });
    if (!initialized || !initialized.serverInfo) {
      throw new Error('MCP initialize response is missing serverInfo');
    }
    notify('notifications/initialized');

    const result = await request('tools/list');
    const tools = Array.isArray(result.tools) ? result.tools : [];
    const names = new Set(tools.map(tool => tool.name));
    const required = [
      'agent_browser_open',
      'agent_browser_snapshot',
      'agent_browser_close',
    ];
    const missing = required.filter(name => !names.has(name));
    if (missing.length) {
      throw new Error('Required MCP tools missing: ' + missing.join(', '));
    }

    console.log('PASS: MCP stdio initialize');
    console.log('PASS: tools/list (' + tools.length + ' tools discovered)');
    console.log('PASS: ' + required.join(', '));
    console.log('Server: ' + initialized.serverInfo.name + ' ' + (initialized.serverInfo.version || ''));
  } catch (error) {
    console.error('FAIL: ' + error.message);
    if (stderr.trim()) console.error(stderr.trim());
    if (stdoutNoise.trim()) console.error('Unexpected stdout:\n' + stdoutNoise.trim());
    process.exitCode = 1;
  } finally {
    child.stdin.end();
    setTimeout(() => child.kill('SIGTERM'), 1500).unref();
  }
})();
