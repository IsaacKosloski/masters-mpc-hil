# Notas de aula (Beamer, tema LABSEMdisciplina)

Tema e identidade vêm do `labsem-brand` (cópia fixada em [`labsem-brand/`](labsem-brand/README.md));
decisão em [ADR-0006](../docs/adr/0006-tema-labsem-v2.md).

```powershell
.\tools\slides.ps1            # deck completo  -> slides\build\main.pdf
.\tools\slides.ps1 r01-git    # um modulo      -> slides\build\r01-git.pdf
.\tools\slides.ps1 vivo       # recompila ao salvar
.\tools\slides.ps1 limpar     # apaga slides\build
```

Requer TeX Live 2023+ ou MiKTeX com XeLaTeX e `latexmk`. As fontes IBM Plex vêm na cópia do tema.

## Estrutura do deck

```
\bloco{Revisões}                                  -> \part   (cabeçalho da barra lateral)
  \modulo[R01 Git]{r01}{R01 -- Git}               -> \section + quadro de abertura do módulo
    \subsection[Curto]{Título completo}           -> tópico (aparece expandido na barra)
  \emconstrucao[R02 LaTeX/Beamer]{r02}{R02 -- ...} -> destino ainda não escrito
\bloco{Disciplina}
  ...
\appendix                                         -> respostas e derivações
```

A barra lateral mostra o bloco atual, os módulos vizinhos ao atual (janela de 3 para cada lado,
opção `janela=` em `preambulo/tema.tex`; `0` mostra todos) e **expande só o módulo atual** com seus
tópicos; o ponto de cobre marca o tópico atual. Na base: contador, progresso e os botões
**MENU**, **MÓD.** e **↶**. Use títulos curtos (argumento opcional) para caber na barra.

## Adicionar um módulo

1. Crie `modulos/<rotulo>-<nome>.tex` começando por `\modulo[Curto]{<rotulo>}{<Título>}`.
2. Em `main.tex`, troque a linha `\emconstrucao...{<rotulo>}...` por `\input{modulos/<rotulo>-<nome>}`.
3. Respostas/derivações: `modulos/<rotulo>-<nome>-apendice.tex`, começando por
   `\section[Resp. <rotulo>]{...}`, quadros com `label=<rotulo>-...` terminando em `\voltar`;
   inclua-o depois de `\appendix` em `main.tex`.

## Comandos

| Comando | Uso |
|---|---|
| `\bloco[curto]{Título}` | bloco do deck (parte) |
| `\modulo[curto]{r07}{R07 -- Otimização}` | abre módulo |
| `\emconstrucao[curto]{r07}{...}` | módulo ainda não escrito |
| `\botaomenu[código]{rotulo}{Texto}` | cartão dos menus (`código` opcional) |
| `\irpara{rotulo}{Texto}` · `\voltar` · `\verrevisao{r07}` · `\resposta{rotulo}` | navegação |
| `definicao` · `teorema` · `exemplo` · `alerta` · `armadilha` · `seisei` · `exercicio` | caixas |
| `\codigo[style=vhdl, linerange=3-20]{../caminho/arq.vhd}` | código do repo |
| `\cmd{git status}` | comando/arquivo inline |
| `\slideorig{42}` | rastreabilidade ao slide original (não imprime) |
| `\labsemLogo{simbolo}{positivo}` · `\labsemFundo{grafite}` · `\labsemUFMS{8mm}` | marcas e arte |

Estilos de código: `bash`, `ps`, `vhdl`, `tcl`, `matlab`, `python`, `c`.
Cores por nome (`labsemCobre`, `labsemAzulNoturno`, `labsemGrafite`, `labsemPedra`; as antigas
`labsemMarinho`, `labsemGelo`, `labsemVerde` continuam válidas).

Marca UFMS: salve os arquivos oficiais em `labsem-brand/assets/institucional/`
(`ufms-marca-positivo.pdf`, `ufms-marca-negativo.pdf`); sem eles aparece um espaço reservado.

## Convenções de código LaTeX

- Recuo de **2 espaços** por nível (`.editorconfig`); conteúdo de `frame`, `itemize`,
  `tikzpicture` e `columns` sempre recuado.
- `lstlisting` pode ser recuado junto com o frame: `autogobble` remove o recuo comum.
- Um comando TikZ por linha; opções longas quebradas e alinhadas.
- Comentários de seção com réguas `% ----`.
