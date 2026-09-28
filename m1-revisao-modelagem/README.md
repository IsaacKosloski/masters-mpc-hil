# M1 — Revisão matemática, modelagem e ferramentas

Bloco 1 da ementa: da descrição de hardware em VHDL à realimentação de estados.

## Estrutura

```
m1-revisao-modelagem/
├── README.md         este índice
├── notas/            teoria (baseada nos livros) — leia antes de cada exemplo
├── exemplos/         exemplos resolvidos em aula (uma pasta = uma unidade)
└── exercicios/       exercícios propostos (idem)
```

Cada unidade segue o gabarito `templates/unit/` (manifesto, `ref/`, `hdl/`, `tb/`, `sim/`).
Nome: `<grupo>-<nn>-<tema>` em minúsculas, sem acentos.

## Mapa slide → unidade → nota → revisão

| Slide | Unidade | Nota | Revisão prévia |
|---|---|---|---|
| 24–27 | `exemplos/vhdl-01-circuito-logico` | 01 | R12, R13 |
| 20–23 | `exemplos/vhdl-02-mux-prioridade` | 01 | R12 |
| 35–36 | `exemplos/vhdl-03-flipflop-d` | 01, 02 | R12, R13, R14 |
| 37–41 | `common/hdl/vendor/bishop` + `.\tools\bishop.ps1` | 03 | R14 |
| 42 | `exemplos/bishop-01-multiplicacao` | 03 | R03, R09 |
| 43 | `exemplos/bishop-02-<tema>` | 03 | R03 |
| 44 | `exemplos/bishop-03-<tema>` | 03 | R03 |
| 45 | `exemplos/bishop-04-<tema>` | 03 | R03 |
| 46 | `exemplos/bishop-05-inversa`, `bishop-06-inversa` | 03 | R03 |
| 47–48 | `exemplos/bishop-07-<tema>`, `bishop-08-<tema>` | 03, 04 | R03, R05 |
| 49 | `exercicios/exr-01-ackermann-satelite` | 04 | R04, R05 |

Ajuste números de slide e temas ao abrir cada enunciado.

## Ordem de estudo

1. Revisões **R12, R13, R14** (VHDL, simulação por CLI, Tcl) → nota 01 e 02 → exemplos `vhdl-*`.
2. Nota 03 + compilar a `ieee_proposed` → **R03, R09** → exemplos `bishop-01..06`.
3. **R04, R05** → nota 04 → exemplos `bishop-07/08` → exercício `exr-01`.
