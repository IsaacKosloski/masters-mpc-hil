# Convenções do repositório

## Commits — Conventional Commits

`tipo(escopo): descrição no imperativo` (até ~72 caracteres)

| Tipo | Uso |
|---|---|
| `feat` | funcionalidade/unidade nova |
| `fix` | correção |
| `docs` | documentação, notas, slides |
| `test` | testbenches e testes |
| `refactor` | reorganização sem mudar comportamento |
| `build` | scripts de build/toolchain |
| `ci` | pipelines |
| `chore` | manutenção |
| `style` | formatação |
| `perf` | desempenho |
| `revert` | reversão de commit |

Escopos: `vhdl`, `tcl`, `matlab`, `python`, `slides`, `docs`, `ci`, `repo`,
ou a revisão/unidade (`r01`, `m2`, `proj1`...). Quebra de compatibilidade: `!`
após o escopo. Corpo (opcional) explica o **porquê**.

Um commit = um assunto (`git add -p` para separar).

## Branches

`main` sempre verde. Trabalho em `tipo/escopo-descricao`, ex.:
`ci/r01-pipeline`, `feat/m2-turbina-gerador`, `docs/r02-notas`.

## Fluxo

issue → branch → commits → PR (título convencional) → CI verde → revisão →
**squash merge** → branch apagada.

## Versões (SemVer)

- `0.MINOR.PATCH` durante revisões e fases.
- `MINOR` +1 a cada revisão ou fase concluída; `PATCH` para correções.
- `1.0.0` = projeto final HiL entregue.
- Tag anotada `vX.Y.Z` → release automática (workflow `release.yml`).

## Labels

`tipo:feat|fix|docs|ci|chore`, `area:vhdl|tcl|matlab|python|slides|ci`,
`errata`, `bloqueado`. Milestones = revisões (R01–R15) e fases.
