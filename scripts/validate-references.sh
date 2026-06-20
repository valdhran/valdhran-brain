#!/usr/bin/env bash
# validate-references.sh — detecta referencias cruzadas sin formato link
# Uso: ./scripts/validate-references.sh
# Retorna exit code 1 si encuentra referencias sueltas (para uso en CI)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ERRORS=0

echo "🔍 Valdhran — validando referencias cruzadas en documentación..."
echo ""

# 1. Detectar menciones de DEC-NNN que NO son links markdown
echo "── Buscando referencias DEC sueltas ──"
while IFS= read -r line; do
    echo "  ⚠️  $line"
    ERRORS=$((ERRORS + 1))
done < <(grep -rn "DEC-[0-9]\{3\}" "$REPO_ROOT"/*.md 2>/dev/null \
    | grep -v "^\s*#" \
    | grep -v "\[DEC-" \
    | grep -v "^.*DECISIONS\.md:" \
    | grep -v '`' \
    || true)

# 2. Detectar nombres de archivos .md sin formato link
echo ""
echo "── Buscando referencias a archivos .md sin link ──"
while IFS= read -r line; do
    echo "  ⚠️  $line"
    ERRORS=$((ERRORS + 1))
done < <(grep -rn "\b\(STATUS\|SESSIONS\|DECISIONS\|ARCHITECTURE\|ROADMAP\)\.md\b" \
    "$REPO_ROOT"/*.md 2>/dev/null \
    | grep -v "\[.*\](.*\.md" \
    | grep -v ":1:#" \
    || true)

echo ""
if [ "$ERRORS" -eq 0 ]; then
    echo "✅ Sin referencias sueltas detectadas."
    exit 0
else
    echo "❌ $ERRORS referencia(s) suelta(s) encontrada(s)."
    echo "   Corregir usando el patrón: [DEC-NNN](DECISIONS.md#dec-nnn)"
    exit 1
fi
