# ROADMAP.md — Hoja de Ruta de Valdraegorn

> Estado: BORRADOR INICIAL

## Fase 0 — Fundación (actual)
- [x] Crear organización GitHub `valdraegorn`
- [x] Inicializar `valdraegorn-brain`
- [ ] Definir arquitectura core Rust (DEC-001)
- [ ] Decidir ORM (DEC-002)
- [ ] Crear repos: core, api, web, dashboard, modules
- [ ] Adquirir servidores Hetzner

## Fase 1 — Core MVP
- [ ] `valdraegorn-core`: entidades base, multi-tenant, RBAC
- [ ] `valdraegorn-api`: endpoints CRUD básicos con Axum
- [ ] Auth: JWT + RBAC jerárquico
- [ ] PostgreSQL schema base

## Fase 2 — Módulos PE
- [ ] Módulo facturación SUNAT (comprobantes electrónicos)
- [ ] Módulo planillas PE
- [ ] Integración Culqi (tarjeta + Yape)

## Fase 3 — IA y Dashboard
- [ ] Integración DeepSeek API
- [ ] Asistente ERP en lenguaje natural
- [ ] Dashboard TypeScript sobre la API Rust

## Fase 4 — Ecosistema
- [ ] Integración con Khelvarion (facturación, clientes)
- [ ] Integración con Zhinova (bots vía API)
- [ ] Expansión LATAM
