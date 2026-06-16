# STATUS.md — Estado Actual de Valdhran

> Última actualización: 2026-06-16
> Workspace local: /home/rodri/valdhran-workspace/

## Estado general
🟢 **CORE COMPLETO** — API Rust funcional. Auth + tenants + graphify listos.
   Pendiente: DB real levantada, RegisterUser, módulos ERP, dashboard.

## Próximos pasos
- [ ] Levantar Docker Compose y ejecutar migraciones (docker compose up -d)
- [ ] Probar endpoints con smoke_test.sh
- [ ] POST /tenants/:slug/users — registro de usuarios por tenant
- [ ] Arrancar valdhran-modules: módulo Planillas PE
- [ ] Arrancar valdhran-dashboard: Next.js skeleton + login
- [ ] Adquirir servidores Hetzner

## Repos y estado
- [x] valdhran-brain
- [x] valdhran-core
  - [x] domain: entidades + value objects + repository traits
  - [x] application: 5 casos de uso + ports (RegisterUser, AuthenticateUser,
        RefreshToken, ProvisionTenant, AssignRole)
  - [x] infrastructure: Argon2, JWT, PgTenantRepository, PgUserRepository,
        PgRoleRepository, AppConfig
  - [x] api:
    - POST /auth/login
    - POST /auth/refresh
    - POST /tenants
    - POST /tenants/:slug/users  ← sesión 010
    - GET  /graphify
    - Middleware JWT (AuthClaims extractor)
    - Docker Compose PostgreSQL 16
    - Migraciones SQL + scripts
- [ ] valdhran-modules (vacío — próximo: Planillas PE)
- [ ] valdhran-dashboard (vacío — próximo: Next.js skeleton)
- [ ] valdhran-web (vacío)

## Alertas para Perplexity
_Ninguna._

## Stack confirmado
- Core: Rust 2021 · Tokio · SQLx · Argon2 · JWT
- HTTP: Axum 0.8
- DB: PostgreSQL 16 (schema-per-tenant)
- Auth: JWT + RBAC jerárquico propio
- LLM: DeepSeek API (OpenAI-compatible)
- Secrets: Infisical
- Pagos: Culqi + Yape
- Alertas: Telegram + WhatsApp Meta Cloud API
- Frontend: Next.js (TypeScript)
- Infraestructura: Hetzner + Ubuntu 24.04 (pendiente)
