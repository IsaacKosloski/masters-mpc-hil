# mpc-hil

Repositório de estudo e implementação da disciplina **Projeto de Controle Preditivo baseado em Modelos (MPC) utilizando ferramentas de Hardware-in-the-Loop**.

## Objetivo

Reunir, num único monorepo, todos os exemplos, exercícios, trabalhos e o projeto final da disciplina: da modelagem da planta e do projeto do MPC em MATLAB até o controlador descrito em VHDL, verificado em simulação, sintetizado numa FPGA Intel MAX 10 (DE10-Lite) e validado em Hardware-in-the-Loop. Tudo automatizado por linha de comando (Tcl, MATLAB e Python) e documentado numa apresentação LaTeX/Beamer que serve de notas de aula.

## Estado atual

Em construção — revisão **R1 (Git)**: repositório base, convenções e CI/CD.

## Estrutura

| Pasta | Conteúdo |
|---|---|
| `docs/` | ADRs, convenções, tutoriais, notas, errata e progresso |
| `common/` | Código compartilhado: HDL, Tcl, MATLAB e Python |
| `templates/` | Gabarito de unidade (exemplo/exercício) |
| `revisoes/` | Unidades das revisões R1–R15 |
| `m1-…` a `m6-…` | Módulos da disciplina |
| `projetos/` | Trabalhos avaliados e projeto final HiL |
| `slides/` | Mega-apresentação Beamer |
| `tools/` | Orquestração e automação do repositório |

Detalhes em [`docs/adr/0002-estrutura-do-monorepo.md`](docs/adr/0002-estrutura-do-monorepo.md).

## Requisitos

Git, Python 3 + pre-commit, Intel Quartus Prime Lite, ModelSim/Questa-Intel, MATLAB, TeX Live ou MiKTeX. Versões registradas em `docs/ambiente.md` (a criar).

## Convenções

Ver [`docs/convencoes.md`](docs/convencoes.md).

## Licenças

Código: MIT (`LICENSE`). Textos e slides de minha autoria: CC BY 4.0 (`LICENSE-docs`). Arquivos de terceiros (ex.: `common/hdl/vendor/`) mantêm suas licenças originais. Material da disciplina e dos livros não é redistribuído aqui.
