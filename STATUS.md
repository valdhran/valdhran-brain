# STATUS.md — Estado Actual de Valdhran

> Última actualización: 2026-06-16
> Workspace local: /home/rodri/valdhran-workspace/

## Estado general
🟢 **CORE COMPLETO** — API Rust funcional y verificada. Auth + tenants operativos.

## Próximos pasos
- [ ] Middleware de autenticación JWT (extractor de claims para rutas protegidas)
- [ ] Tests de integración (auth flow completo)
- [ ] Adquirir servidores Hetzner
- [ ] Primer módulo ERP: definir cuál (planillas PE, facturación SUNAT, u otro)

## Repos y estado
- [x] valdhran-brain
- [x] valdhran-core
  - [x] domain: entidades + value objects + repository traits
  - [x] application: 5 casos de uso + ports (RegisterUser, AuthenticateUser,
        RefreshToken, ProvisionTenant, AssignRole)
  - [x] infrastructure: Argon2, JWT, PgTenantRepository, PgUserRepository,
        PgRoleRepository, AppConfig
  - [x] migrations SQL: tenants, refresh_tokens, provision_tenant_schema() — aplicadas en local
  - [x] api: Axum HTTP API — 5 endpoints de auth y tenant provisioning operativos
    - POST /tenants → create + provision schema
    - POST /auth/register
    - POST /auth/login
    - POST /auth/refresh
    - POST /auth/logout
- [x] valdhran-modules — Planillas PE iniciado
- [x] valdhran-dashboard — Next.js skeleton + login
- [ ] valdhran-web (vacío)

## Entorno de desarrollo local

- Docker Compose: `/home/rodri/valdhran-workspace/docker-compose.yml`
- PostgreSQL: `localhost:5433` (puerto ajustado para evitar conflicto con servicios del sistema)
- Container: `valdhran-postgres` (imagen `postgres:16-alpine`)
- Credenciales dev: usuario `valdhran`, password `valdhran_dev`, db `valdhran`
- `.env`: `/home/rodri/valdhran-workspace/valdhran-core/.env` (no versionado)
- Estado: ✅ operativo — `docker compose up -d` desde workspace raíz

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
