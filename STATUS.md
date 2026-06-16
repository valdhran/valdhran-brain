# STATUS.md — Estado Actual de Valdraegorn

> Última actualización: 2026-06-15

## Estado general
🟢 **FUNDACIÓN ACTIVA** — Arquitectura definida. Core Rust inicializado.

## Sesión activa
- Fecha: 2026-06-15
- Foco: Application layer + schema PostgreSQL base

## Próximos pasos
- [ ] Implementar infrastructure: Argon2PasswordHasher, JwtTokenService, PgTenantRepository, PgUserRepository, PgRoleRepository
- [ ] Inicializar valdraegorn-api (Axum) con endpoints de auth: POST /auth/login, POST /auth/refresh
- [ ] Provisioning dinámico de schema por tenant (CreateTenant completo)
- [ ] Adquirir servidores Hetzner

## Repos y estado
- [x] valdraegorn-brain
- [x] valdraegorn-core
  - [x] domain: Tenant, User, Role, Permission + value objects + repository traits
  - [x] application: CreateTenant, RegisterUser, AuthenticateUser, RefreshToken, AssignRole
  - [x] infrastructure: migrations SQL base (tenants global + schema por tenant)
- [x] valdraegorn-api (vacío)
- [x] valdraegorn-modules (vacío)
- [x] valdraegorn-dashboard (vacío)
- [x] valdraegorn-web (vacío)

## Alertas para Perplexity
_Ninguna._

## Stack confirmado
- Core: Rust 2021 · Tokio · SQLx · Argon2 · JWT
- HTTP: Axum
- DB: PostgreSQL (schema-per-tenant)
- Auth: JWT + RBAC jerárquico propio
- LLM: DeepSeek API (OpenAI-compatible)
- Secrets: Infisical
- Pagos: Culqi + Yape
- Alertas: Telegram + WhatsApp Meta Cloud API
- Frontend: Next.js (TypeScript)
- Infraestructura: Hetzner + Ubuntu 24.04 (pendiente)
