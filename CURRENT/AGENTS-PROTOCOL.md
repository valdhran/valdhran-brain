---
type: runbook
title: "Protocolo Agentes — Valdhran"
description: "Flujo de trabajo Perplexity ↔ Claude Code. Rutinas de inicio, cierre y reglas de autonomía."
tags: [protocol, agents, perplexity, claude-code]
timestamp: 2026-06-30
refs:
  - DECISIONS.md
  - STATUS.md
---

# AGENTS-PROTOCOL — Valdhran

> Perplexity debate y genera prompts. Claude Code ejecuta; nunca decide.

## Orden de lectura obligatorio al iniciar sesión
1. STATUS.md — atender alertas antes de continuar
2. DECISIONS.md — últimas 5 DECs vigentes
3. Solo si el tema lo requiere: archivo específico (ARCHITECTURE, ROADMAP, etc.)

## Autonomía de Claude Code
### Puede hacer sin consultar:
- Leer cualquier archivo del brain
- Actualizar STATUS.md al cerrar sesión
- Agregar nuevas entradas DEC a DECISIONS.md
- Corregir frontmatter OKF incorrecto

### Debe consultar antes de hacer:
- Modificar ARCHITECTURE.md o ROADMAP.md (decisiones de diseño)
- Eliminar o renombrar archivos
- Cambiar stack o dependencias principales
- Modificar GROWTH.md o DESIGN.md (solo Perplexity + Rodhan)

## Checklist de cierre de sesión
- [ ] STATUS.md actualizado (estado actual, commits, alertas, próximos pasos)
- [ ] Nuevas decisiones registradas en DECISIONS.md (DEC-XXX)
- [ ] git add . && git commit && git push (brain + repos de código)
- [ ] Sin push = Perplexity lee datos desactualizados en siguiente sesión

## Límites de archivos CURRENT/
- Tamaño máximo por archivo: ~15 KB
- Si un archivo supera 15 KB → mover historial a ARCHIVE/

## Anti-patrones prohibidos
- Resolver síntomas sin documentar causa raíz en DECISIONS.md
- Modificar código sin diagnóstico cuando la causa raíz no es evidente
- Asumir que el repo está actualizado — siempre verificar STATUS.md primero
- Duplicar contenido entre archivos — solo referenciar con links

## Sugerencias proactivas al cerrar sesión
Al final de cada sesión, Claude Code sugiere:
- ¿Hay algo que debería documentarse como DEC?
- ¿Algún archivo CURRENT/ está por superar 15 KB?
- ¿STATUS.md refleja el estado real actual?
