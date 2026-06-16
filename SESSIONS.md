# Valdhran — Registro de sesiones

## Sesión 008 — 2026-06-16

**Objetivo**: Middleware JWT + infraestructura local completa

**Realizado**:
- `AuthClaims` extractor usando `FromRequestParts<AppState>` (Axum 0.8 RPITIT)
- `decode_access_token()` público en `JwtTokenService`
- Migraciones SQL:
  - `0001_create_tenants.sql` — tabla global tenants
  - `0002_tenant_schema_template.sql` — función PL/pgSQL provision_tenant_schema()
- `docker-compose.yml` — PostgreSQL 16 Alpine
- `.env.example` — plantilla configuración DATABASE__URL + JWT__SECRET
- Scripts bash:
  - `run_migrations.sh` — ejecuta ambas migraciones
  - `smoke_test.sh` — prueba POST /tenants, /auth/login, /auth/refresh

**Bloqueadores resueltos**:
- Error de lifetimes en `FromRequestParts` — solución: usar RPITIT sin `async_trait`

**Commit**: `ea8718f feat(api): middleware JWT, migraciones SQL, Docker Compose, smoke tests`

---

## Sesión 007 — 2026-06-16

**Objetivo**: Implementar crate `valdhran-api` con Axum

**Realizado**:
- Estructura Axum con `AppState` (pool, jwt_service, hasher)
- Handlers stub: auth (login, refresh) + tenants (create)
- Router con CORS + tracing

**Commit**: `89e295c feat(api): Axum HTTP layer — auth + tenant endpoints`

---

## Sesión 005 — 2026-06-15

**Objetivo**: Renombrar proyecto Valdraegorn → Valdhran

**Realizado**:
- Renombrado de todos los crates, namespaces, documentación
- Actualización de git remotes

**Commit**: `aca27df chore: rename project Valdraegorn → Valdhran`
