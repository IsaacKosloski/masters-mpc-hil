# Identidade visual primária — LABSEM (v0.1, proposta)

Laboratório de Sistemas Embarcados · Faculdade de Engenharias · UFMS

> **Status:** proposta. Marca adicional de unidade: exige aprovação da coordenação do
> laboratório e solicitação à Agecom/UFMS via SEI (Manual de Identidade Visual UFMS,
> seção *Marcas adicionais*). Uso restrito a divulgação e material didático, sempre
> junto da marca UFMS, nunca em documentos oficiais.

## Gerar

```powershell
.\tools\identidade.ps1   # -> docs\identidade\build\ (manual.pdf + peças em PDF, SVG e PNG)
```

SVG e PNG exigem o `pdftocairo` (Poppler): `winget install oschwartz10612.Poppler`.

Fonte única: `slides/tema/labsem-marca.sty` (TikZ). Peças e manual são gerados, não versionados.

## Símbolo

Um circuito integrado visto de cima — corpo marinho, quatro pinos de cobre por lado — com
duas trilhas de circuito impresso em azul UFMS formando **L** e **S**, terminadas em vias.

- **Área de proteção:** 1X, onde X = largura do corpo do chip ÷ 4.
- **Redução mínima:** símbolo 8 mm (24 px); assinatura horizontal 30 mm.
- **Assinaturas:** horizontal (preferencial), vertical, símbolo isolado.
- **Variantes:** cor · negativo (sobre azul UFMS ou marinho) · monocromática.

## Paleta

| Papel | Nome | HEX | RGB | CMYK (aprox.) |
|---|---|---|---|---|
| Primária institucional | Azul UFMS | `#0088B7` | 0 136 183 | 100 0 0 30 (manual UFMS) |
| Primária | Marinho | `#0B2E4A` | 11 46 74 | 85 38 0 71 |
| Acento | Cobre | `#C8702A` | 200 112 42 | 0 44 79 22 |
| Apoio | Verde | `#1E7F5C` | 30 127 92 | 76 0 28 50 |
| Apoio | Vermelho | `#B3261E` | 179 38 30 | 0 79 83 30 |
| Texto | Grafite | `#2B333B` | 43 51 59 | 27 14 0 77 |
| Fundo | Gelo | `#EAF4F8` | 234 244 248 | 6 2 0 3 |
| Fundo | Cinza | `#F3F5F7` | 243 245 247 | 2 1 0 3 |
| Texto pequeno | Azul texto | `#00729A` | 0 114 154 | 100 26 0 40 |
| Texto pequeno | Cobre texto | `#A35C20` | 163 92 32 | 0 44 80 36 |

Azul UFMS e cobre puros têm contraste ≈ 4,0 e 3,6 sobre branco: use-os em áreas, grafismos e
títulos grandes. Para texto pequeno, as variantes *texto* (≥ 4,5:1, WCAG AA).

## Tipografia

**Fira Sans** (SIL OFL): ExtraBold no logotipo, Regular/SemiBold em textos; **Fira Mono** em código.

## Grafismo

Trilhas ortogonais com dobras a 45° e vias (`\labsemtrilhas`), em capas, divisórias e
encerramentos, com baixa opacidade e nunca atrás de texto corrido.

## Convivência com a marca UFMS (resumo do manual UFMS)

- Sempre junto da marca UFMS, respeitando a área de proteção dela.
- Horizontal: UFMS à direita das demais; vertical: UFMS abaixo.
- Nenhum elemento da marca UFMS compõe a marca LABSEM.
- Slides: marca UFMS no canto inferior direito do conteúdo; slide final com fundo azul
  `#0088B7` e marcas em negativo.

## Usos indevidos

Distorcer, girar, trocar cores, aplicar negativo em fundo claro, usar fundo sem contraste,
trocar a fonte do logotipo.
