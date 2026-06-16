# STATUS.md — Estado Actual de Valdraegorn

> Última actualización: 2026-06-15

## Estado general
🟢 **FUNDACIÓN ACTIVA** — Arquitectura definida. Core Rust inicializado.

## Sesión activa
- Fecha: 2026-06-15
- Foco: Creación de repos y estructura base del core Rust

## Próximos pasos
- [ ] Implementar entidades base en domain (Tenant, User, Role)
- [ ] Implementar RBAC jerárquico en domain
- [ ] Crear schema PostgreSQL base con migrations (SQLx)
- [ ] Inicializar valdraegorn-api (Axum)
- [ ] Adquirir servidores Hetzner
- [ ] Decidir framework frontend: Next.js (DEC-003 vigente)

## Repos creados
- [x] valdraegorn-brain (fuente de verdad)
- [x] valdraegorn-core (Cargo workspace, arquitectura hexagonal)
- [x] valdraegorn-api
- [x] valdraegorn-modules
- [x] valdraegorn-dashboard
- [x] valdraegorn-web

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
