# Amoot Machine API

Node.js + Express + Prisma + PostgreSQL API for the Amoot Machine storefront.

## Requirements
- Node.js 20+
- PostgreSQL 14+
- A strong private JWT secret (32+ characters)

## Local setup
1. Copy `.env.example` to `.env` and set a private database URL and JWT secret.
2. Create the PostgreSQL database and database role with least-privilege permissions.
3. Run:
   ```bash
   npm install
   npx prisma generate
   npx prisma db push
   npm run db:seed
   npm run dev
   ```
4. Health check: `GET http://127.0.0.1:4000/api/health`.

For a production deployment, create and review a migration with `npx prisma migrate dev --name init` in a controlled development database, commit the generated `prisma/migrations` directory, then run `npx prisma migrate deploy` in production. Do not use `db push` as the production migration process.

## Admin bootstrap
Set `ADMIN_IDENTIFIER`, `ADMIN_PASSWORD` (12+ random characters recommended), and optionally `ADMIN_NAME` in the private environment before `npm run db:seed`. Never commit a real `.env` or credentials. The seed script does not create a default password.

## API
- `GET /api/health`
- `POST /api/auth/register` { identifier, displayName, password }
- `POST /api/auth/login` { identifier, password }
- `GET /api/me` (Bearer token)
- `GET /api/products?q=&category=&brand=&model=`
- `GET /api/products/:sku`
- `POST /api/orders` (Bearer token, Idempotency-Key header)
- `GET /api/orders` and `GET /api/orders/:orderNumber` (Bearer token)
- `POST /api/quotes`
- `GET /api/admin/orders` (ADMIN/OPERATOR)
- `PATCH /api/admin/orders/:orderNumber/status` (ADMIN/OPERATOR)

Prices are integer IRR values serialized as strings to avoid JavaScript precision loss. Order creation validates prices and stock in a serializable transaction and decrements stock atomically. Passwords use Argon2id; access tokens expire after 12 hours.

## Important deployment boundary
The GitHub Pages frontend is static and cannot host this API or PostgreSQL. Deploy this `api/` directory to a Node.js host and PostgreSQL service, configure `CORS_ORIGINS` with the exact storefront origin, then connect the frontend to the resulting HTTPS API URL. Until that integration and deployment are completed, the live storefront continues to use browser-local demo data. OTP, payment gateway, SMS, email delivery, refunds, and production operational monitoring are not implemented yet.
