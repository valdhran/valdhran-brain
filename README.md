# Valdhran Brain

Repositorio de documentación y decisiones arquitectónicas del proyecto Valdhran ERP.

## Archivos

- **[DECISIONS.md](DECISIONS.md)** — Decisiones técnicas y de negocio (formato ADR simplificado)
- **[SESSIONS.md](SESSIONS.md)** — Registro cronológico de sesiones de desarrollo
- **[STATUS.md](STATUS.md)** — Estado actual del proyecto (completado, en progreso, pendiente)

## Propósito

Este repo centraliza la memoria institucional del proyecto. Cada decisión arquitectónica queda documentada con su razonamiento, alternativas descartadas y estado (VIGENTE/SUPERSEDED). Las sesiones de desarrollo se registran con objetivos, realizaciones y commits asociados.

## Estándar de referencias cruzadas

Toda referencia a una decisión o documento dentro de este repo debe ser un link navegable.

### Formato

| Qué referenciar | Formato correcto |
|---|---|
| Decisión específica | `[DEC-001](DECISIONS.md#dec-001)` |
| Archivo completo | `[SESSIONS.md](SESSIONS.md)` |
| Sección de archivo | `[STATUS.md § Entorno](STATUS.md#entorno-de-desarrollo-local)` |

### Reglas
- La ancla de un DEC es siempre `#dec-NNN` (heading `## DEC-NNN — Título` → `#dec-nnn`)
- Si no estás seguro de la ancla exacta, usar link sin ancla antes que inventar una incorrecta
- Nunca: texto plano `DEC-006`, negrita `**DEC-006**`, o link sin ancla cuando la ancla existe

### Validación automática
```bash
./scripts/validate-references.sh
```
Retorna exit 0 si todo está correcto. Ejecutar antes de cada commit a este repo.
