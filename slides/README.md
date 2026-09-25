# Notas de aula (Beamer, tema LABSEM)

Tema em `slides/tema/` (ver `slides/tema/README.md`); identidade em `docs/identidade/`.

```powershell
.\tools\slides.ps1            # deck completo  -> slides\build\main.pdf
.\tools\slides.ps1 r01-git    # um modulo      -> slides\build\r01-git.pdf
.\tools\slides.ps1 vivo       # recompila ao salvar
.\tools\slides.ps1 limpar     # apaga slides\build
```

## Estrutura do deck

```
\bloco{Revisões}                                  -> \part   (cabeçalho da barra lateral)
  \modulo[R01 Git]{r01}{R01 -- Git}               -> \section + menu do módulo
    \subsection[Curto]{Título completo}           -> tópico (aparece expandido na barra)
  \emconstrucao[R02 LaTeX/Beamer]{r02}{R02 -- ...} -> destino ainda não escrito
\bloco{Disciplina}
  ...
\appendix                                         -> respostas e derivações
```

A barra lateral mostra o bloco atual, a lista de módulos desse bloco (▸) e **expande só
o módulo atual** (▾) com seus tópicos. Clicar em um módulo abre-o. Use títulos curtos
(argumento opcional) para caber na barra.

## Adicionar um módulo

1. Crie `modulos/<rotulo>-<nome>.tex` começando por `\modulo[Curto]{<rotulo>}{<Título>}`.
2. Em `main.tex`, troque a linha `\emconstrucao...{<rotulo>}...` por `\input{modulos/<rotulo>-<nome>}`.
3. Respostas/derivações: `modulos/<rotulo>-<nome>-apendice.tex`, começando por
   `\section[Resp. <rotulo>]{...}`, frames com `label=<rotulo>-...` terminando em `\voltar`;
   inclua-o depois de `\appendix` em `main.tex`.

## Convenções de código LaTeX

- Recuo de **2 espaços** por nível (`.editorconfig`); conteúdo de `frame`, `itemize`,
  `tikzpicture` e `columns` sempre recuado.
- `lstlisting` pode ser recuado junto com o frame: `autogobble` remove o recuo comum.
- Um comando TikZ por linha; opções longas quebradas e alinhadas.
- Comentários de seção com réguas `% ----`.

## Comandos do preâmbulo

| Comando | Uso |
|---|---|
| `\bloco[curto]{Título}` | bloco do deck (parte) |
| `\modulo[curto]{r07}{R07 -- Otimização}` | abre módulo |
| `\emconstrucao[curto]{r07}{...}` | módulo ainda não escrito |
| `\verrevisao{r07}` | botão para a revisão |
| `\irpara{rotulo}{Texto}` | botão para qualquer frame |
| `\voltar` | volta à página anterior |
| `\codigo[style=vhdl, linerange=3-20]{../caminho/arq.vhd}` | código do repo |
| `\cmd{git status}` | comando/arquivo inline |
| `\slideorig{42}` | rastreabilidade ao slide original (não imprime) |
