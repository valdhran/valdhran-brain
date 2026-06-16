# SESSIONS.md — Registro de Sesiones de Trabajo

> Una entrada por sesión. Incluye fecha, foco, decisiones tomadas y próximos pasos.

***

## Sesión 001 — 2026-06-15

**Foco:** Inicialización del proyecto Valdraegorn

**Actividades:**
- Creación de la organización GitHub `valdraegorn`
- Inicialización del repo `valdraegorn-brain`
- Creación de la estructura base de documentación: STATUS.md, DECISIONS.md, SESSIONS.md, docs/

**Decisiones tomadas:** Ninguna técnica aún — pendiente debate con Perplexity

**Próxima sesión:** Definir arquitectura del core Rust (DEC-001) y ORM (DEC-002)

***

## Sesión 002 — 2026-06-15

**Foco:** Fundación del ERP — decisiones arquitectónicas y creación de repos

**Actividades:**
- Creación de 5 repos en la org GitHub `valdraegorn`
- Inicialización de `valdraegorn-core` como Cargo workspace con arquitectura hexagonal
- Registro de DEC-001 a DEC-004 en DECISIONS.md

**Decisiones tomadas:**
- DEC-001: Arquitectura hexagonal (domain / application / infrastructure)
- DEC-002: SQLx sobre SeaORM
- DEC-003: Next.js para el dashboard
- DEC-004: Schema-per-tenant para aislamiento total entre clientes

**Próxima sesión:** Implementar entidades base del domain: Tenant, User, Role, Permission

***

## Sesión 003 — 2026-06-15

**Foco:** Entidades base del domain Rust

**Actividades:**
- Implementación de entidades: Tenant, User, Role, Permission
- Implementación de value objects: Email, TenantSlug
- Definición de traits de repositorio: TenantRepository, UserRepository, RoleRepository
- Registro de DEC-005 (UUID v4)

**Decisiones tomadas:**
- DEC-005: UUID v4 para todos los IDs de entidades

**Próxima sesión:** Casos de uso en application crate (CreateTenant, RegisterUser, AssignRole) + schema PostgreSQL base con SQLx migrations
