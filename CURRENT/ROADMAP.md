---
type: concept
title: "Roadmap Valdhran ERP"
description: "Fases del proyecto: multi-tenancy, módulos core (contabilidad, inventario, facturación, CRM), IA nativa y open-source release"
tags: [roadmap, planning, phases]
timestamp: 2026-06-30
---

# ROADMAP.md — Hoja de Ruta de Valdhran

> Estado: BORRADOR INICIAL

## Fase 0 — Fundación (actual)
- [x] Crear organización GitHub `valdhran`
- [x] Inicializar `valdhran-brain`
- [x] Definir arquitectura core Rust (DEC-001)
- [x] Decidir ORM (DEC-002)
- [x] Crear repos: core, api, web, dashboard, modules
- [ ] Adquirir servidores Hetzner

## Fase 1 — Core MVP
- [x] `valdhran-core`: entidades base, multi-tenant, RBAC
- [ ] `valdhran-api`: endpoints CRUD básicos con Axum
- [ ] Auth: JWT + RBAC jerárquico
- [x] PostgreSQL schema base

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
