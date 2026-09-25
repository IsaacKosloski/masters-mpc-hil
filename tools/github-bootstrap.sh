#!/usr/bin/env bash
# Cria labels (idempotente) e milestones das revisões no repositório atual.
# Requer: gh autenticado e rodar dentro do repositório. Rodar uma vez.
set -euo pipefail

label() { gh label create "$1" --color "$2" --description "$3" --force; }

label "tipo:feat"   "1f883d" "Funcionalidade/unidade nova"
label "tipo:fix"    "d73a4a" "Correção"
label "tipo:docs"   "0075ca" "Documentação, notas, slides"
label "tipo:ci"     "5319e7" "Pipelines"
label "tipo:chore"  "cfd3d7" "Manutenção"
label "area:vhdl"   "fbca04" "VHDL"
label "area:tcl"    "fef2c0" "Tcl / automação EDA"
label "area:matlab" "e99695" "MATLAB/Simulink"
label "area:python" "3572a5" "Python"
label "area:slides" "c5def5" "LaTeX/Beamer"
label "area:ci"     "bfdadc" "CI/CD"
label "errata"      "b60205" "Erro nos slides/livros"
label "bloqueado"   "000000" "Aguardando algo externo"

revisoes=(
  "R01 — Git" "R02 — LaTeX/Beamer" "R03 — Álgebra linear" "R04 — Laplace e Z"
  "R05 — Espaço de estados" "R06 — Controle clássico" "R07 — Otimização quadrática"
  "R08 — Observadores e Kalman" "R09 — MATLAB" "R10 — Simulink" "R11 — Python/NumPy"
  "R12 — VHDL" "R13 — Quartus/ModelSim CLI" "R14 — Tcl" "R15 — Ponto-fixo"
)
for m in "${revisoes[@]}"; do
  gh api "repos/{owner}/{repo}/milestones" -f title="$m" --silent || true
done
echo "Labels e milestones criados."
