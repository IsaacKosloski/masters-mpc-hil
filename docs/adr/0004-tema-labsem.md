# 0004 — Tema LABSEM (derivado do AAU Sidebar) e identidade visual

- **Status:** Aceito — substitui a parte "tema" do ADR-0003
- **Data:** AAAA-MM-DD

## Contexto

As notas passam a representar o LABSEM/UFMS. Pedido: layout com barra lateral no estilo
do *AAU Sidebar Beamer Theme* e identidade visual própria do laboratório.

## Opções consideradas

1. Moloch recolorido — sem barra lateral de navegação.
2. AAU Sidebar original — traz logotipo e ondas da AAU (protegidos), sem 16:9 afinado.
3. **Fork do AAU Sidebar** como tema `LABSEM`, sem nenhum elemento gráfico da AAU.

## Decisão

- Tema `LABSEM` em `slides/tema/`, derivado do Aalborg/AAU Sidebar (GPL-3.0, atribuição
  mantida): barra lateral esquerda, barra vertical com número do frame, cabeçalho claro.
- Faixa superior compacta (8 mm, opção `header=`; `0mm` remove) e barra lateral estreita
  (2,2 cm, opção `width=`).
- Barra lateral **expansível**: o deck é dividido em blocos (`\bloco` = `\part`); a barra
  lista os módulos do bloco atual e expande só o módulo atual com seus tópicos; base com
  botões Menu | Mód. | Voltar (substituem o rodapé do Moloch).
- Identidade em `labsem-marca.sty` (CC BY 4.0), desenhada em TikZ: símbolo "chip LS",
  paleta ancorada no azul UFMS `#0088B7`, cobre como acento, Fira Sans.
- Regras do Manual de Identidade Visual UFMS aplicadas: marca UFMS no canto inferior
  direito do conteúdo (se o arquivo oficial existir em `slides/tema/marcas/`), slide final
  azul com marcas em negativo, LABSEM como marca adicional.
- Peças e manual gerados por `tools/identidade.ps1`; não versionados.

## Consequências

O tema exige ≥ 3 passagens do LuaLaTeX (`remember picture`): `latexmkrc` define
`max_repeat`. A marca LABSEM é **proposta** até aprovação da coordenação e da Agecom.
