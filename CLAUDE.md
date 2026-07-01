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

## Rutina de cierre de sesión — OBLIGATORIO

1. Actualizar STATUS.md (estado actual, commits recientes, alertas, próximos pasos)
2. git add . && git commit -m "docs: end-of-session sync $(date +%Y-%m-%d)"
3. git push (brain + repos de código que tuvieron cambios)

⚠️ Sin push al final de sesión, Perplexity lee datos desactualizados en GitHub
   la próxima vez que use MCP para tomar contexto del proyecto.
