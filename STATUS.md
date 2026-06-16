# STATUS.md — Estado Actual de Valdhran

> Última actualización: 2026-06-16
> Workspace local: /home/rodri/valdhran-workspace/

## Estado general
🟢 **FUNDACIÓN ACTIVA** — Arquitectura definida. Core Rust inicializado.

## Sesión activa
- Fecha: 2026-06-16
- Foco: Renombrado completo del proyecto Valdraegorn → Valdhran

## Próximos pasos
- [ ] Implementar infrastructure: Argon2PasswordHasher, JwtTokenService, PgTenantRepository, PgUserRepository, PgRoleRepository
- [ ] Inicializar valdhran-api (Axum) con endpoints de auth: POST /auth/login, POST /auth/refresh
- [ ] Provisioning dinámico de schema por tenant (CreateTenant completo)
- [ ] Adquirir servidores Hetzner

## Repos y estado
- [x] valdhran-brain (https://github.com/valdhran/valdraegorn-brain)
- [x] valdhran-core (https://github.com/valdhran/valdraegorn-core)
  - [x] domain: Tenant, User, Role, Permission + value objects + repository traits
  - [x] application: CreateTenant, RegisterUser, AuthenticateUser, RefreshToken, AssignRole
  - [x] infrastructure: migrations SQL base (tenants global + schema por tenant)
- [x] valdhran-api (vacío)
- [x] valdhran-modules (vacío)
- [x] valdhran-dashboard (vacío)
- [x] valdhran-web (vacío)

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
