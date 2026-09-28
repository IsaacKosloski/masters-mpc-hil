# 0006 — Adotar o tema LABSEM v2 (labsem-brand) no deck

- **Status:** Aceito — substitui o ADR-0004
- **Data:** 2026-09-27

## Contexto

O deck usava o tema `LABSEM` de `slides/tema/`, derivado do *AAU Sidebar Beamer Theme* (GPL-3.0),
e a identidade v0.1 desenhada em `labsem-marca.sty` (símbolo "chip LS", Fira Sans). O laboratório
passou a manter a identidade v2 e os temas LaTeX no repositório `labsem-brand`, que traz um tema
de disciplina com barra lateral e a mesma API de navegação (`\bloco`, `\modulo`, `\emconstrucao`,
`\irpara`, `\voltar`, `\botaomenu`, `\codigo`, `\cmd`, `armadilha`, `seisei`).

## Opções consideradas

1. Manter o fork do AAU Sidebar e só trocar cores e fontes — continua GPL e diverge do labsem-brand.
2. Usar o `labsem-brand` como **submódulo** — é o previsto, mas o repositório ainda não está publicado.
3. **Cópia fixada** do subconjunto necessário do `labsem-brand` em `slides/labsem-brand/`, trocada por
   submódulo quando ele for publicado.

## Decisão

Opção 3, como passo transitório para a 2.

- Tema `LABSEMdisciplina` (MIT) com `marca=a` (a marca B vira arte auxiliar), `final=ufms`
  (slide final azul UFMS, como pede o MIV) e `compat=true` (cores antigas continuam válidas).
- `slides/labsem-brand/` é somente leitura, marcado como *vendored* no `.gitattributes` e
  excluído dos hooks de pre-commit.
- Compilação com XeLaTeX via `latexmk` (`slides/latexmkrc`); LuaLaTeX continua possível.
- Saem `slides/tema/`, `preambulo/navegacao.tex`, `preambulo/codigo.tex`, `docs/identidade/fonte/`
  e `tools/identidade.*`.

## Consequências

- O deck não depende mais de código GPL; as licenças do repositório voltam a ser só MIT e CC BY 4.0.
- Comandos do tema antigo (`\labsemsimbolo`, `\labsemassinatura`, `\labsemtrilhas`, `\ufmsmarca`)
  não existem mais: usar `\labsemLogo`, `\labsemFundo` e `\labsemUFMS`.
- Atualizar o tema = substituir a cópia fixada (e, depois, fazer `checkout` de outra tag no submódulo).
- A marca LABSEM continua **proposta** até a aprovação da coordenação e da Agecom.
