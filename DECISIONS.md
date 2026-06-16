# DECISIONS.md — Decisiones Técnicas y de Negocio

> Formato: DEC-XXX | Fecha | Título | Decisión | Razonamiento | Estado

***

## DEC-001 — Arquitectura interna del core Rust

| Campo | Contenido |
|-------|-----------|
| ID | DEC-001 |
| Fecha | 2026-06-15 |
| Título | Arquitectura hexagonal con Cargo workspace |
| Decisión | El core se organiza como Cargo workspace con 3 crates: domain (entidades puras), application (casos de uso), infrastructure (implementaciones concretas: PostgreSQL, JWT, etc.) |
| Razonamiento | Separación estricta de capas garantiza que la lógica de negocio no dependa de frameworks ni bases de datos. El dominio es testeable de forma aislada. Cambiar un proveedor (ej. DB) no toca el dominio. |
| Alternativas descartadas | Monolito sin separación de capas (descartado: difícil de mantener y testear a escala ERP) |
| Estado | VIGENTE |

***

## DEC-002 — ORM

| Campo | Contenido |
|-------|-----------|
| ID | DEC-002 |
| Fecha | 2026-06-15 |
| Título | SQLx sobre SeaORM |
| Decisión | Usar SQLx para acceso a PostgreSQL |
| Razonamiento | SQL explícito con verificación en tiempo de compilación. Control total sobre queries complejas. Sin magia de ORM que pueda generar queries ineficientes o inseguras. Esencial para un ERP con lógica de negocio compleja. |
| Alternativas descartadas | SeaORM (descartado: abstracción excesiva, menor control, overhead en queries complejas de ERP) |
| Estado | VIGENTE |

***

## DEC-003 — Framework frontend del dashboard

| Campo | Contenido |
|-------|-----------|
| ID | DEC-003 |
| Fecha | 2026-06-15 |
| Título | Next.js para el dashboard |
| Decisión | Dashboard construido en Next.js (TypeScript) |
| Razonamiento | Ecosistema maduro, SSR robusto, amplia cobertura de librerías de seguridad y auditoría. El peso adicional es aceptable dado el criterio de robustez del proyecto. |
| Alternativas descartadas | SvelteKit (descartado: ecosistema más pequeño, menos herramientas de seguridad maduras) |
| Estado | VIGENTE |

***

## DEC-004 — Estrategia multi-tenant

| Campo | Contenido |
|-------|-----------|
| ID | DEC-004 |
| Fecha | 2026-06-15 |
| Título | Schema-per-tenant en PostgreSQL |
| Decisión | Cada tenant tiene su propio schema en PostgreSQL. No se comparte schema entre tenants. |
| Razonamiento | Aislamiento total de datos por cliente. Una vulnerabilidad en un tenant no puede exponer datos de otro. Crítico para un ERP que maneja planillas, datos financieros y legales de empresas distintas. |
| Alternativas descartadas | Row-level con tenant_id (descartado: riesgo de filtración de datos entre tenants si hay un bug en queries; inaceptable para ERP con datos sensibles) |
| Estado | VIGENTE |
