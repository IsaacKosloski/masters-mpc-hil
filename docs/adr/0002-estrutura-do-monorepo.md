# 0002 — Estrutura do monorepo

- **Status:** Aceito
- **Data:** AAAA-MM-DD

## Contexto

Um único repositório conterá revisões, exemplos, exercícios, trabalhos,
projeto final e slides, em várias linguagens (VHDL, Tcl, MATLAB, Python,
LaTeX). Precisa crescer sem reorganizações e sem editar scripts centrais a
cada novo exemplo.

## Decisão

```text
mpc-hil/
├── docs/            adr/, tutoriais/, notas/, convencoes.md, progresso.md,
│                    errata.md, licoes.md, rastreabilidade.md
├── common/          hdl/{vendor,pkg}, tcl/, matlab/, python/   (compartilhado)
├── templates/unit/  gabarito de unidade
├── revisoes/        unidades das revisões R01–R15
├── m1-revisao-modelagem/
├── m2-fundamentos-mpc/
├── m3-restricoes-robustez/
├── m4-laguerre/
├── m5-simulink-cosim/
├── m6-hil/
├── projetos/        trabalhos avaliados e projeto final
├── slides/          deck Beamer
└── tools/           orquestração e automação
```

Regras:

1. **Unidade autocontida.** Cada exemplo/exercício/projeto é uma pasta com
   `README.md`, `manifest.*` e as subpastas `ref/ hdl/ tb/ sim/ syn/ out/`
   (só as necessárias). O formato do manifesto é decidido em ADR próprio.
2. **Nada duplicado.** Código usado por mais de uma unidade vai para `common/`.
3. **Gerado não se versiona.** `out/`, bibliotecas compiladas, bancos do
   Quartus, bitstreams e PDFs são reconstruídos por comando.
4. **Nomes** em minúsculas, ASCII, `kebab-case`, sem espaços nem acentos
   (ferramentas de EDA no Windows falham com esses caracteres).
5. **Terceiros** em `common/hdl/vendor/<nome>/` com `README.md` de procedência
   (origem, versão, licença), sem modificações locais.
6. Os módulos `m1`–`m6` podem ser renomeados/subdivididos por novo ADR.

## Consequências

Adicionar conteúdo = criar uma pasta a partir do gabarito. Orquestrador,
manifesto e CI serão construídos para descobrir unidades automaticamente.
