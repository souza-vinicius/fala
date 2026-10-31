#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

need() {
  [[ -f $1 ]] || fail "missing $1"
}

need GLOSSARY.md
need README.md
need AGENTS.md
need docs/prd.md
need docs/diretrizes.md
need docs/adr/0001-gemma-no-aparelho.md
need docs/adr/0002-bandeja-e-area-de-transferencia.md
need docs/adr/0003-codigo-aberto-fora-da-loja.md
need docs/adr/0004-option-direita-toque-e-segura.md
need docs/decisions.tsv

terms=(
  Recorte
  Bandeja
  Tomada
  Texto
  "Área de transferência"
  Notch
  Dock
  "Option direita"
  Toque
  Segura
  "Campo ativo"
  "Campo de senha"
  Cola
  Ouvindo
  Escrevendo
  Entregue
  Guardada
  Descartada
)

for term in "${terms[@]}"; do
  grep -q "^\*\*${term}\*\*:" GLOSSARY.md || fail "glossary missing ${term}"
done

headings=(
  "## Resumo"
  "## Contexto"
  "## Problema e quem usa"
  "## Objetivos"
  "## O que o Fala faz"
  "## Experiência"
  "## Requisitos"
  "## Fora de escopo"
  "## Perguntas abertas"
  "## Premissas"
)

for heading in "${headings[@]}"; do
  grep -q "^${heading}$" docs/prd.md || fail "prd missing ${heading}"
done

grep -q "bandeja" docs/diretrizes.md || fail "diretrizes missing bandeja"
grep -q "área de transferência" docs/diretrizes.md || fail "diretrizes missing área de transferência"

for token in Take Clip Tray listening writing delivered held discarded; do
  grep -q "\`${token}\`" AGENTS.md || fail "AGENTS.md missing ${token}"
done

header=$(head -n 1 docs/decisions.tsv)
[[ $header == $'ts\tphase\tdecision\twhy\tevidence\tresult' ]] || fail "decision log header"

for phase in frame glossary adr prd diretrizes; do
  grep -q $'\t'"${phase}"$'\t' docs/decisions.tsv || fail "decision log missing phase ${phase}"
done

python3 - "$root" <<'PY'
import pathlib, sys
root = pathlib.Path(sys.argv[1])
files = list(root.glob("*.md")) + list((root / "docs").rglob("*.md"))
bad = []
for path in files:
    text = path.read_text()
    for lineno, line in enumerate(text.splitlines(), 1):
        if "\u2014" in line or "\u2013" in line or "\u201c" in line or "\u201d" in line:
            bad.append(f"{path.relative_to(root)}:{lineno}")
if bad:
    print("\n".join(bad), file=sys.stderr)
    sys.exit(1)
PY

echo "foundation ok. files, terms, and headings are in place. a take is not proven."
