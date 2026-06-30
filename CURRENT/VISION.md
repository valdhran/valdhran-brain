---
type: reference
title: "Visión del Producto"
description: "Documento fundacional — qué es Valdhran, para quién, y hacia dónde va. Claude Code debe leer este archivo antes de proponer cambios de arquitectura o nuevas funcionalidades."
tags: [vision, product, estrategia]
timestamp: 2026-06-29
---

# VISION.md — Valdhran

## ¿Qué es Valdhran?

ERP modular construido en Rust con IA nativa. Diseñado para ser multi-tenant desde el diseño inicial, autoalojable en servidores propios, y con LLM integrado para asistencia en lenguaje natural.

**Valor diferencial:** Combina la velocidad y seguridad de Rust con módulos especializados para el contexto peruano (planillas, facturación SUNAT, legal) y asistente IA nativo que permite consultar el ERP en lenguaje natural.

## El problema que resuelve

**Problema:** Pequeñas y medianas empresas peruanas enfrentan:
- ERPs comerciales caros (SAP, Oracle) o inflexibles (Odoo)
- No autoalojables (lock-in a proveedores cloud)
- Sin capacidades IA nativas (consultas en lenguaje natural, alertas predictivas)
- Módulos genéricos que no se adaptan a regulación peruana (SUNAT, planillas T-REGISTRO, contratos laborales PE)

**Solución:** Valdhran permite:
1. Autoalojar en Hetzner u otro proveedor a elección
2. Multi-tenant: una instalación sirve múltiples clientes
3. Módulos peruanos nativos: planillas PE, facturación SUNAT, legal PE
4. Asistente IA: "¿cuánto debo pagar de planilla este mes?" → respuesta inmediata vía DeepSeek
5. Arquitectura modular: activar solo módulos necesarios

## Para quién

**Usuarios primarios:**
1. **Pequeñas y medianas empresas peruanas** — necesitan ERP funcional sin pagar licencias caras
2. **Desarrolladores que operan múltiples negocios** — multi-tenant permite gestionar varios clientes desde una instalación
3. **Contadores/administradores** — interfaz dashboard para operaciones diarias

**Contexto de uso:**
- Dashboard web (TypeScript) para operadores
- API REST (Axum) + gRPC para integraciones
- Self-hosted en Hetzner (no SaaS)
- Multi-tenant: una instancia, múltiples empresas con datos aislados

**Expansión futura:** Módulos internacionales (facturación México, planillas Chile), integración con otros proyectos del ecosistema (Khelvarion consume módulos de facturación/clientes, Zhinova bots consultan ERP vía API).

## Arquitectura de producto

**Repositorios del ecosistema:**
- `valdhran-core` — motor principal: entidades, RBAC, workflows, multi-tenant
- `valdhran-api` — API HTTP (Axum) + gRPC
- `valdhran-modules` — módulos por dominio (planillas PE, facturación, SUNAT, legal PE)
- `valdhran-dashboard` — UI TypeScript para operadores
- `valdhran-web` — landing y portal público

**Stack tecnológico:**
- **Lenguaje:** Rust
- **HTTP:** Axum
- **Async runtime:** Tokio
- **Base de datos:** PostgreSQL (multi-tenant vía schemas por tenant)
- **ORM:** SQLx o SeaORM (DEC-002 pendiente)
- **Auth:** JWT + RBAC jerárquico propio
- **IA:** DeepSeek API (OpenAI-compatible)
- **Infraestructura:** Hetzner + Ubuntu 24.04
- **Secrets:** Infisical

**Flujo principal:**
```
Usuario operador → Dashboard web
      ↓
API Axum (JWT auth)
      ↓
valdhran-core (lógica de negocio, multi-tenant)
      ↓
PostgreSQL (schema por tenant)
      ↓
Módulos especializados (planillas, SUNAT, legal)
      ↓
Asistente IA (DeepSeek) para consultas en lenguaje natural
```

**Módulos core (planificados):**
1. **Planillas PE** — cálculo AFP/ONP, CTS, gratificaciones, T-REGISTRO
2. **Facturación SUNAT** — comprobantes electrónicos, integración SUNAT
3. **Legal PE** — contratos laborales, registro de documentos
4. **Clientes y pagos** — reutilizable por otros proyectos (Khelvarion, Zhinova)

## Principios que Claude Code debe respetar

### 1. Multi-tenant desde el diseño, no como parche
- Cada tenant tiene su propio schema PostgreSQL
- `provision_tenant_schema()` crea estructura DB completa por tenant
- NUNCA compartir datos entre tenants en la misma tabla
- Middleware de tenant extrae `tenant_id` de JWT y lo inyecta en contexto

### 2. Rust para core, TypeScript solo para UI
- Lógica de negocio, validaciones, cálculos → Rust
- Dashboard y landing → TypeScript/Next.js
- NO implementar lógica de negocio en frontend

### 3. IA nativa, no chatbot pegado después
- DeepSeek integrado en `valdhran-core` desde el inicio
- Casos de uso: asistente ERP en lenguaje natural, alertas inteligentes, análisis predictivo
- NO usar IA para tomar decisiones críticas (cálculo de planilla, facturación) sin validación humana

### 4. Autoalojable, nunca vendor lock-in
- Todo deployable en Hetzner u otro VPS a elección
- NO depender de servicios cloud propietarios sin alternativa self-hosted
- Infisical para secrets, pero con fallback a `.env` si no está disponible

### 5. Módulos independientes, no monolito acoplado
- `valdhran-modules` contiene módulos por dominio (planillas, SUNAT, etc.)
- Cada módulo tiene su propia DB migration y puede activarse/desactivarse
- Khelvarion puede consumir módulos de Valdhran sin importar todo el core

### 6. RBAC jerárquico propio, no auth de terceros
- JWT + RBAC custom en Rust
- Roles: SuperAdmin (multi-tenant), TenantAdmin, User
- Ver DEC-001 si existe (arquitectura auth)

## Estado actual

**Fase:** Core completo — API Rust funcional y verificada. Auth + tenants operativos.

**Componentes operativos:**
- ✅ `valdhran-core` (domain, application, infrastructure)
- ✅ API Axum (5 endpoints auth + tenant provisioning)
- ✅ Migrations SQL (tenants, refresh_tokens, provision_tenant_schema)
- ✅ `valdhran-modules` — Planillas PE iniciado
- ✅ `valdhran-dashboard` — Next.js skeleton + login

**Endpoints operativos:**
- `POST /tenants` → create + provision schema
- `POST /auth/register`
- `POST /auth/login`
- `POST /auth/refresh`
- `POST /auth/logout`

**Pendientes:**
- 🔄 Middleware autenticación JWT (extractor de claims para rutas protegidas)
- 🔄 Tests de integración (auth flow completo)
- 🔄 Adquirir servidores Hetzner
- 🔄 Primer módulo ERP completo (planillas PE, facturación SUNAT, u otro)

**Decisiones pendientes:**
- DEC-001: Arquitectura interna del core Rust
- DEC-002: ORM (SQLx vs SeaORM)
- DEC-003: Framework frontend del dashboard

Ver [STATUS.md](STATUS.md) y [ROADMAP.md](ROADMAP.md) para estado detallado.
