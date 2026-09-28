# Nota 01 — VHDL essencial para os exemplos do M1

> Slides 17–36. Livros: *Free Range VHDL* (FR), Chu *RTL Hardware Design Using VHDL* (Chu),
> Altera *Introduction to VHDL* (AIV).

## 1. VHDL descreve hardware, não executa passos

Tudo o que está fora de um `process` acontece **ao mesmo tempo** (concorrente): cada linha é
um pedaço de circuito ligado aos outros por **sinais** (fios). Dentro de um `process`, as
linhas são lidas em sequência, mas o resultado continua sendo um circuito.
FR cap. 1 (regras de ouro) e 4; Chu cap. 3.

## 2. Unidade de projeto = `entity` + `architecture`

- `entity`: a "caixa preta" — nomes, direções (`in`/`out`) e tipos das portas.
- `architecture`: o conteúdo da caixa.
- Bibliotecas: `ieee.std_logic_1164` (tipo `std_logic`, 9 valores: `'0' '1' 'U' 'X' 'Z'`…)
  e `ieee.numeric_std` (`signed`/`unsigned`). Os slides citam `std_logic_arith` e
  `std_logic_unsigned`: **não são padrão IEEE**; use `numeric_std`.

FR cap. 3; Chu cap. 3; AIV módulo *VHDL Basics*.

## 3. Duas formas de escolher: concorrente × sequencial

| Concorrente (fora de process) | Sequencial (dentro de process) |
|---|---|
| `y <= a when s = "00" else b when s = "01" else c;` (`when/else`) | `if … elsif … else … end if;` |
| `with s select y <= …;` (`with/select`) | `case s is when … end case;` |

`when/else` e `if/elsif` testam as condições **em ordem**: a primeira verdadeira vence →
isso é um **multiplexador com prioridade**. `with/select` e `case` não têm prioridade
(todas as escolhas são exclusivas). FR 4.4–4.6; Chu cap. 4 (concorrente) e 5 (sequencial).

## 4. Processo combinacional × síncrono

- **Combinacional**: a lista de sensibilidade tem **todos** os sinais lidos, e toda saída
  recebe valor em todos os caminhos. Faltou um caminho → o sintetizador infere um
  **latch** (memória indesejada). Em VHDL-2008: `process (all)`.
- **Síncrono** (flip-flop): muda só na borda do relógio.
  ```
  process (clk, rst)          -- reset assíncrono entra na lista
  begin
    if rst = '1' then q <= '0';
    elsif rising_edge(clk) then
      if en = '1' then q <= d; end if;
    end if;
  end process;
  ```
  Esse é o **padrão** (molde), não a solução de um exemplo. FR 12.1–12.2; Chu cap. 8–9;
  AIV *Process Statement*.

## 5. Sinal × variável

- Sinal (`<=`): o novo valor só aparece **depois** que o processo suspende (delta).
- Variável (`:=`): muda **na hora**, só existe dentro do processo.
FR cap. 10.4; Chu cap. 5.

## 6. Testbench

Entidade **sem portas** que instancia o projeto (DUT), gera estímulos com `wait for` e
verifica saídas com `assert`/`report`. Nosso padrão: comparar com a referência e
acumular erros no sinal `falhas` (ver `common/hdl/pkg/tb_util_pkg.vhd`).
O `force` dos slides (ModelSim) serve para experimentar; o testbench é reprodutível.

## 7. Armadilhas frequentes

- Ler um sinal logo após atribuí-lo no mesmo processo (ainda vale o valor antigo).
- Condição `else` em reset: em t = 0 o `rst` vale `'U'`; use `elsif rst = '0'`.
- Esquecer um sinal na lista de sensibilidade: a simulação difere da síntese.

## Autoteste

1. Qual a diferença de hardware entre `when/else` e `with/select`?
2. Por que um `if` sem `else` num processo combinacional gera latch?
3. Em que momento `q` muda num FF com reset assíncrono ativo?
