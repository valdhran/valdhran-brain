# Protocolo Claude Code — Valdhran

## Rutina de inicio de sesión

Leer SIEMPRE en este orden:

1. `valdhran-brain/CURRENT/STATUS.md` — estado actual (atender alertas antes de continuar)
2. `valdhran-brain/CURRENT/DECISIONS.md` — decisiones vigentes
3. Solo si el tema lo requiere: leer archivo específico (ARCHITECTURE, ROADMAP, etc.)

## Reglas fundamentales

1. **PostgreSQL schema-per-tenant — cada empresa aislada:**
   - NO usar shared tables entre tenants
   - tenant_id obligatorio en todas las tablas

2. **Rust idiomático + sqlx compile-time checks:**
   - NO raw SQL strings
   - Aprovechar type safety del compilador

3. **Open-source desde día 1:**
   - Decisiones arquitectónicas deben ser públicas
   - Documentar razonamiento en DECISIONS.md

4. **Toda decisión técnica → nueva entrada DEC-XXX:**
   - Agregar a `valdhran-brain/CURRENT/DECISIONS.md`

5. **GROWTH.md y DESIGN.md solo Perplexity + Rodhan:**
   - Claude Code NO modifica salvo instrucción explícita

## División de responsabilidades

**Perplexity:** investiga, debate, genera prompts, escribe en valdhran-brain (docs). Nunca escribe código.

**Claude Code:** ejecuta prompts, escribe código, actualiza STATUS.md al finalizar. Nunca decide sin prompt.

**Rodhan:** decisiones de negocio, aprobación arquitectura, dirección producto.

## Protocolo diagnóstico antes de fix

Antes de generar cualquier prompt de cambio, evaluar:

1. ¿STATUS.md fue actualizado en las últimas 24h? Si no → pedir diagnóstico
2. ¿La tarea involucra módulo/tenant cuyo estado no está documentado? → pedir diagnóstico
3. ¿El cambio afecta multi-tenancy o schema migrations? → pedir diagnóstico primero

## Regla de oro

valdhran-brain es la única fuente de verdad.
Perplexity debate y genera prompts. Claude Code ejecuta; nunca decide.

---

## Convenciones OKF — obligatorio en todo archivo MD del brain

### Frontmatter obligatorio
Todo archivo creado o modificado en CURRENT/ debe tener:
```yaml
---
type: concept | runbook | reference | log
title: "Título del documento"
description: "Descripción breve (1-2 líneas)"
tags: [tag1, tag2]   # máximo 5
timestamp: YYYY-MM-DD
# Campos opcionales:
volatile: true        # solo STATUS.md
resource: ../ruta/    # apunta a código/CAD/assets fuera del brain (DEC-002)
refs:                 # apunta a otros docs del brain (DEC-004)
  - OTRO-DOC.md
  - DECISIONS.md
---
```

### Cuándo usar resource: vs refs:
- `resource:` → el doc describe un artefacto externo al brain (código, CAD, config)
  Ejemplo: ARCHITECTURE.md que documenta src/modulo/ → resource: ../../src/modulo/
- `refs:` → el doc depende o referencia otros docs del brain
  Ejemplo: REQUIREMENTS.md que referencia GROWTH.md → refs: [GROWTH.md, ROADMAP.md]

### Cross-references entre documentos
- Siempre usar links Markdown con anclas: [DEC-014](DECISIONS.md#dec-014)
- Nunca duplicar contenido de otro doc — solo referenciar
- Decisiones superadas: marcar [SUPERSEDED por DEC-XXX] al inicio de la sección
- Antes de crear contenido nuevo, verificar que no existe ya en otro archivo del brain

### Numeración DEC
- Formato: DEC-001, DEC-002... (secuencial por proyecto)
- Scope en commit: feat(DEC-XXX): o docs(DEC-XXX):
- Consultar DECISIONS.md para saber el próximo número disponible

---

### Límites y mantenimiento de archivos CURRENT/
- Tamaño máximo por archivo: ~15 KB — si supera, mover historial a ARCHIVE/
- División CURRENT/ARCHIVE: CURRENT/ solo tiene docs activos y vigentes
- ARCHIVE/ recibe: sesiones antiguas, DECs superadas, auditorías pasadas

### Sugerencias proactivas al cerrar sesión
Al final de cada sesión, evaluar y reportar:
- ¿Hay decisión tomada hoy que deba registrarse como DEC-XXX?
- ¿Algún archivo CURRENT/ está por superar ~15 KB?
- ¿STATUS.md refleja el estado real al cierre?

## Rutina de cierre de sesión — OBLIGATORIO

1. Actualizar STATUS.md (estado actual, commits recientes, alertas, próximos pasos)
2. git add . && git commit -m "docs: end-of-session sync $(date +%Y-%m-%d)"
3. git push (brain + repos de código que tuvieron cambios)

⚠️ Sin push al final de sesión, Perplexity lee datos desactualizados en GitHub
   la próxima vez que use MCP para tomar contexto del proyecto.
