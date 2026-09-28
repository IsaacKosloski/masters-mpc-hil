# Nota 02 — Simulação no ModelSim pela linha de comando

> Slides 28–36, 41. Referências: Altera *Designing with Quartus II* (fluxo),
> manual de comandos do ModelSim (`Help → Command Reference`).

## 1. O ciclo

| Comando | Faz | Analogia |
|---|---|---|
| `vlib work` | cria uma biblioteca (pasta) | abrir uma gaveta |
| `vmap nome caminho` | dá um nome lógico à gaveta (grava no `modelsim.ini`) | etiquetar a gaveta |
| `vcom -2008 arq.vhd` | compila VHDL para a biblioteca | guardar a peça pronta |
| `vsim work.tb` | carrega o projeto para simular | montar a bancada |
| `add wave …` | escolhe sinais para ver | ligar o osciloscópio |
| `force sinal valor tempo` | impõe valores (experimento manual) | gerador de sinais |
| `run 100 ns` / `run -all` | avança o tempo | apertar *play* |
| `quit -f -code n` | sai devolvendo código n | fechar a bancada |

`force CLK 0 0, 1 50 -r 100` (slide 36): 0 no instante 0, 1 em 50 ns, repete a cada 100 ns.

## 2. Arquivo `.do` = script Tcl

Tudo o que se digita no console pode ir num `.do` e rodar com `do arq.do`. É Tcl: aceita
variáveis, `foreach`, `if`. Nosso `common/tcl/sim.tcl` é um `.do` genérico que lê o
`manifest.tcl` da unidade.

## 3. Modo batch × GUI

- `vsim -c -do "do sim.tcl"` — sem janela; ideal para teste automático (`sim.ps1`).
- `vsim -gui -do …` — com janela; para olhar ondas (`sim.ps1 -Gui`).
- Em batch, `onerror {quit -f -code 1}` faz o script parar no primeiro erro de compilação.

## 4. Ordem de compilação

Quem **usa** vem depois de quem é **usado**: pacote → corpo do pacote → entidade →
testbench. Bibliotecas externas (ex.: `ieee_proposed`) compiladas antes e mapeadas com
`vmap`.

## Autoteste

1. O que acontece se o testbench for compilado antes do pacote que ele usa?
2. Para que serve o `modelsim.ini` e por que ele não vai para o git?
3. Qual a diferença entre `run 1 us` e `run -all`?
