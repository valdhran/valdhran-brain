# STATUS.md — Estado Actual de Valdraegorn

> Última actualización: 2026-06-15

## Estado general
🟢 **FUNDACIÓN ACTIVA** — Arquitectura definida. Core Rust inicializado.

## Sesión activa
- Fecha: 2026-06-15
- Foco: Entidades domain Rust + RBAC jerárquico

## Próximos pasos
- [ ] Implementar casos de uso en application (CreateTenant, RegisterUser, AssignRole)
- [ ] Implementar schema PostgreSQL base con migrations (SQLx)
- [ ] Inicializar valdraegorn-api (Axum) con los primeros endpoints
- [ ] Adquirir servidores Hetzner

## Repos y estado
- [x] valdraegorn-brain
- [x] valdraegorn-core — domain: entidades base implementadas (Tenant, User, Role, Permission)
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
