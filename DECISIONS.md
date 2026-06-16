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

***

## DEC-005 — Identificadores de entidades

| Campo | Contenido |
|-------|-----------|
| ID | DEC-005 |
| Fecha | 2026-06-15 |
| Título | UUID v4 para todos los IDs |
| Decisión | Todas las entidades usan UUID v4 como identificador primario |
| Razonamiento | No predecible — un atacante no puede enumerar tenants, usuarios ni recursos por fuerza bruta. Esencial para un ERP con datos sensibles de múltiples empresas. |
| Alternativas descartadas | i64 autoincrement (descartado: IDs predecibles, riesgo de enumeración); UUID v7 (descartado: complejidad adicional sin beneficio claro en esta etapa) |
| Estado | VIGENTE |

***

## DEC-006 — Seguridad de refresh tokens

| Campo | Contenido |
|-------|-----------|
| ID | DEC-006 |
| Fecha | 2026-06-15 |
| Título | Refresh token rotation + hash en BD |
| Decisión | Los refresh tokens se rotan en cada uso (el token viejo se revoca al emitir uno nuevo). En BD solo se almacena el hash del token, nunca el token en claro. |
| Razonamiento | La rotación limita la ventana de ataque si un token es interceptado — solo puede usarse una vez. El hash en BD garantiza que una filtración de la tabla no expone tokens válidos. |
| Alternativas descartadas | Refresh tokens estáticos sin rotación (descartado: si un token es robado, es válido indefinidamente hasta expiración) |
| Estado | VIGENTE |

***

## DEC-007 — Renombrado del proyecto: Valdraegorn → Valdhran

| Campo | Contenido |
|-------|-----------|
| ID | DEC-007 |
| Fecha | 2026-06-16 |
| Título | Renombrado del proyecto: Valdraegorn → Valdhran |
| Decisión | El proyecto cambia de nombre oficial de "Valdraegorn" a "Valdhran" |
| Razonamiento | Mejor pronunciabilidad en español/LATAM (3 sílabas vs 4), nombre más contundente, mantiene la raíz Quenya VAL- (poder divino). La organización GitHub ya fue migrada a github.com/valdhran. |
| Workspace local | /home/rodri/valdhran-workspace/ |
| Impacto | Todos los repos, documentación, referencias internas, URLs y rutas locales reflejan el nuevo nombre. |
| Estado | VIGENTE |
