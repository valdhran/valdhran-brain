# Valdhran — Estado del proyecto

## ✅ Completado

- **Sesión 005**: Renombrado de proyecto Valdraegorn → Valdhran
- **Sesión 006**: Crate `valdhran-infrastructure` — Argon2, JWT, repos PostgreSQL
- **Sesión 007**: Crate `valdhran-api` con Axum — endpoints auth + tenants
- **Sesión 008**: Middleware JWT + infraestructura local
  - AuthClaims extractor (FromRequestParts)
  - Migraciones SQL (tenants + provision_tenant_schema)
  - Docker Compose + scripts smoke_test + run_migrations
- **Sesión 009**: Endpoint GET /graphify — grafo de dependencias del workspace

## 🚧 En progreso

Nada actualmente.

## 📋 Pendiente

- [ ] Probar GET /graphify contra el workspace local
- Implementar handlers completos (auth, tenants)
- Tests de integración con PostgreSQL
- Deploy scripts
- Documentación API
