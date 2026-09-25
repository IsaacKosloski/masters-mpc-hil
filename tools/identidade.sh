#!/usr/bin/env bash
# Gera o manual e as peças da identidade LABSEM em docs/identidade/build/
#   PDF (vetor), SVG (web) e PNG 1200 px (fundo transparente).
set -euo pipefail
raiz="$(cd "$(dirname "$0")/.." && pwd)"
src="$raiz/docs/identidade/fonte"
out="$raiz/docs/identidade/build"
mkdir -p "$out"
export TEXINPUTS="$raiz/slides/tema//:"
cd "$src"

nome=manual; lualatex -interaction=nonstopmode -halt-on-error -output-directory="$out" manual.tex >/dev/null || { echo "falhou: $nome"; tail -20 "$out/$nome.log"; exit 1; }
nome=manual; lualatex -interaction=nonstopmode -halt-on-error -output-directory="$out" manual.tex >/dev/null || { echo "falhou: $nome"; tail -20 "$out/$nome.log"; exit 1; }

for peca in simbolo horizontal vertical; do
  for var in cor negativo mono; do
    nome="labsem-$peca-$var"
    lualatex -interaction=nonstopmode -halt-on-error -output-directory="$out" \
      -jobname="$nome" "\\def\\peca{$peca}\\def\\variante{$var}\\input{pecas}" >/dev/null || { echo "falhou: $nome"; tail -20 "$out/$nome.log"; exit 1; }
    if command -v pdftocairo >/dev/null; then
      pdftocairo -svg "$out/$nome.pdf" "$out/$nome.svg"
      pdftocairo -png -transp -singlefile -scale-to 1200 "$out/$nome.pdf" "$out/$nome"
    fi
  done
done
rm -f "$out"/*.aux "$out"/*.log
echo "Identidade gerada em $out"
