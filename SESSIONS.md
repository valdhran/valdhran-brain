# Valdhran — Registro de sesiones

## Sesiones iniciales (001-004)

**Período**: 2026-06-15

**Realizado**:
- Inicialización Cargo workspace con arquitectura hexagonal
- Crate `valdhran-domain` — entidades base (Tenant, User, Role, Permission) + value objects + repository traits
- Crate `valdhran-application` — casos de uso (CreateTenant, RegisterUser, AuthenticateUser, RefreshToken, AssignRole) + migrations SQL base

**Commits**:
- `dca1ae5 chore: inicialización Cargo workspace con arquitectura hexagonal`
- `337a22c feat(domain): entidades base Tenant, User, Role, Permission + value objects + repository traits`
- `67b3419 feat(application): casos de uso CreateTenant, RegisterUser, AuthenticateUser, RefreshToken, AssignRole + migrations SQL base`

---

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

---

## Sesión 006 — 2026-06-16

**Objetivo**: Implementar crate `valdhran-infrastructure`

**Realizado**:
- `Argon2PasswordHasher` — implementa port `PasswordHasher`
- `JwtTokenService` — implementa ports `TokenService` + `RefreshTokenValidator`
  - Hash SHA-256 de refresh tokens (DEC-006)
- Repositorios PostgreSQL con SQLx:
  - `PgTenantRepository`
  - `PgUserRepository`
  - `PgRoleRepository`
- `AppConfig` — carga configuración desde variables de entorno

**Commit**: `ea8569a feat(infrastructure): Argon2, JWT, repositorios PostgreSQL, AppConfig`

---

## Sesión 009 — 2026-06-16

**Foco**: Endpoint GET /graphify — grafo de dependencias del workspace

**Actividades**:
- GET /graphify: escanea el Cargo workspace y retorna nodos + aristas en JSON
- Ignora assets binarios: png, svg, jpg, gif, ico, woff, woff2, ttf, pdf, zip
- Ignora directorios: target, .git, node_modules
- Detecta dependencias internas vs externas entre crates
- Retorna stats: total_crates, total_dependencies, internal_dependencies, files_scanned
- cargo check -p valdhran-api OK

**Decisiones tomadas**: Ninguna nueva.

**Próxima sesión**: Levantar Docker + ejecutar migraciones + smoke test real.

**Commit**: `7e8928b feat(api): GET /graphify — grafo de dependencias del workspace Rust`

---

## Sesión 010 — 2026-06-16

**Foco**: Sincronización brain + RegisterUser endpoint + estructura módulos ERP

**Actividades**:
- STATUS.md y SESSIONS.md sincronizados con estado real del proyecto
- POST /tenants/:slug/users — registro de usuario en tenant
  - Handler resuelve tenant por slug, crea PgUserRepository con schema del tenant
  - Ejecuta RegisterUserUseCase con repo específico + Argon2PasswordHasher
  - Valida tenant existe (404 si no), email único por tenant
- Estructura inicial valdhran-modules (Planillas PE):
  - Trabajador: DNI, nombres, cargo, sueldo, régimen laboral, sistema pensionario
  - Concepto: conceptos de planilla según SUNAT PLAME
- Skeleton valdhran-dashboard (Next.js):
  - lib/api.ts: apiFetch helper + login()
  - app/login/page.tsx: formulario autenticación
  - app/dashboard/page.tsx: placeholder dashboard
- cargo check -p valdhran-api OK
- cargo check (modules) OK  
- npx tsc --noEmit (dashboard) OK

**Decisiones tomadas**: Ninguna nueva.

**Próxima sesión**: Docker up + migraciones + smoke test real.

**Commits**:
- `57fcf92 feat(api): POST /tenants/:slug/users — registro de usuarios por tenant`
- `b6b52dd feat(planillas-pe): entidades base — Trabajador, Concepto, regímenes PE`
- `4c88f85 feat: Next.js skeleton — login page + API client`
