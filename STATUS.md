# STATUS.md — Estado Actual de Valdraegorn

> Última actualización: 2026-06-15

## Estado general
🟡 **INICIALIZACIÓN** — Repositorio recién creado. Sin decisiones técnicas aún.

## Sesión activa
- Fecha: 2026-06-15
- Foco: Inicialización del brain repo y estructura base de documentación

## Próximos pasos
- [ ] Debatir y registrar arquitectura inicial del core Rust (DEC-001)
- [ ] Definir ORM: SQLx vs SeaORM (DEC-002)
- [ ] Definir framework frontend del dashboard (DEC-003)
- [ ] Adquirir servidores Hetzner
- [ ] Crear repos: valdraegorn-core, valdraegorn-api, valdraegorn-web, valdraegorn-dashboard, valdraegorn-modules

## Alertas para Perplexity
_Ninguna por ahora._

## Stack confirmado
- Lenguaje core: Rust
- HTTP: Axum
- Async: Tokio
- DB: PostgreSQL
- Auth: JWT + RBAC jerárquico (propio)
- LLM: DeepSeek API (OpenAI-compatible)
- Secrets: Infisical
- Pagos: Culqi + Yape
- Alertas: Telegram + WhatsApp Meta Cloud API
- Frontend: TypeScript (framework por decidir)
- Infraestructura: Hetzner + Ubuntu 24.04 (pendiente adquisición)
