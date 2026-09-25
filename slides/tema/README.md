# Tema LABSEM (Beamer)

| Arquivo | Conteúdo | Licença |
|---|---|---|
| `labsem-marca.sty` | cores, símbolo, assinaturas e grafismo (TikZ) | CC BY 4.0 |
| `beamertheme*LABSEM.sty` | tema derivado do *AAU Sidebar / Aalborg Beamer Theme* (J. K. Nielsen) | GPL-3.0 (`LICENSE-GPL-3.0.md`) |
| `marcas/` | arquivos oficiais da marca UFMS (opcionais) | UFMS |

A GPL vale para os arquivos do tema, não para as apresentações feitas com ele.

## Opções

```latex
\usetheme[width=2.2cm, header=8mm]{LABSEM}   % padrão
\usetheme[header=0mm]{LABSEM}                % sem faixa superior
\usetheme[width=1.9cm]{LABSEM}               % barra lateral mais estreita
\usetheme[hidetitle, hideinstitute]{LABSEM}
```

## Barra lateral (expansível)

Bloco atual (`\part`) → módulos do bloco (▸) → módulo atual expandido (▾) com os
tópicos (`\subsection`). O círculo sobre a barra vertical marca o frame atual.
Base da barra: botões **Menu**, **Mód.** (menu do módulo) e **↶** (voltar).

## Comandos

| Comando | Uso |
|---|---|
| `\labsemsimbolo[1cm]{cor\|negativo\|mono}` | símbolo |
| `\labsemassinatura[1cm]{...}` / `\labsemvertical[1.4cm]{...}` | assinaturas |
| `\labsemtrilhas{larg mm}{alt mm}{cor}{opacidade}` | grafismo |
| `\finalpage{Obrigado!}` (em frame `[plain]`) | encerramento em azul UFMS |
| `{\labsemfundo \begin{frame}...\end{frame}}` | frame com trilhas ao fundo |
| `\ufmsmarca[8mm]{positivo\|negativo}` | marca UFMS, se o arquivo existir em `marcas/` |
