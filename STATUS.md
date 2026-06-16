# STATUS.md — Estado Actual de Valdhran

> Última actualización: 2026-06-16
> Workspace local: /home/rodri/valdhran-workspace/

## Estado general
🟢 **FUNDACIÓN ACTIVA** — Arquitectura definida. Core Rust inicializado.

## Sesión activa
- Fecha: 2026-06-16
- Foco: Infrastructure layer — implementaciones concretas de ports

## Próximos pasos
- [ ] Inicializar valdhran-api: Axum app + endpoints de auth (POST /auth/login, POST /auth/refresh, POST /tenants)
- [ ] Integrar infrastructure con valdhran-api (inyección de dependencias)
- [ ] Adquirir servidores Hetzner
- [ ] Levantar PostgreSQL local para pruebas de integración

## Repos y estado
- [x] valdhran-brain (https://github.com/valdhran/valdhran-brain)
- [x] valdhran-core (https://github.com/valdhran/valdhran-core)
  - [x] domain: entidades + value objects + repository traits
  - [x] application: 5 casos de uso + ports (PasswordHasher, TokenService, RefreshTokenValidator)
  - [x] infrastructure: Argon2, JWT, PgTenantRepository, PgUserRepository, PgRoleRepository, AppConfig, migrations SQL
- [x] valdhran-api (vacío — próxima sesión)
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
