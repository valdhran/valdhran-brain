# ARCHITECTURE.md — Arquitectura de Valdraegorn

> Estado: BORRADOR — pendiente validación con Perplexity

## Visión general

Valdraegorn es un ERP modular construido en Rust con IA nativa. Diseñado para ser:
- **Multi-tenant** desde el diseño inicial
- **Autoalojable** en servidores propios (Hetzner)
- **AI-native**: LLM integrado para asistencia, alertas y análisis
- **Modular**: módulos independientes por dominio (planillas, facturación, legal, etc.)

## Repositorios del ecosistema

| Repo | Rol |
|------|-----|
| `valdraegorn-core` | Motor principal: entidades, RBAC, workflows, multi-tenant |
| `valdraegorn-api` | API HTTP (Axum) + gRPC — capa pública de acceso al core |
| `valdraegorn-modules` | Módulos ERP por dominio (planillas PE, facturación, SUNAT, legal PE) |
| `valdraegorn-dashboard` | UI TypeScript para operadores y clientes |
| `valdraegorn-web` | Landing y portal público |

## Stack técnico confirmado

### Core
- **Lenguaje:** Rust
- **HTTP:** Axum
- **Async:** Tokio
- **DB:** PostgreSQL
- **ORM:** por decidir (SQLx vs SeaORM) → DEC-002 pendiente
- **Auth:** JWT + RBAC jerárquico propio

### IA
- **LLM:** DeepSeek API (compatible OpenAI-format)
- **Casos de uso:** asistente ERP en lenguaje natural, alertas inteligentes, análisis predictivo

### Infraestructura
- **Servidor:** Hetzner + Ubuntu 24.04 (pendiente adquisición)
- **Secrets:** Infisical
- **Multi-tenant:** sí, desde el diseño inicial

## Integración con el ecosistema
- **Khelvarion** (gestión de granjas) puede consumir módulos de facturación, clientes y pagos de Valdraegorn
- **Zhinova** puede conectar sus bots al ERP vía API para consultas en lenguaje natural
- Los módulos peruanos (planillas, SUNAT, legal) son reutilizables por todos los proyectos del ecosistema

## Decisiones pendientes
- DEC-001: Arquitectura interna del core Rust
- DEC-002: ORM (SQLx vs SeaORM)
- DEC-003: Framework frontend del dashboard
