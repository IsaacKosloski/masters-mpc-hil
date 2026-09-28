# R12 — VHDL (mínimo para o M1)

**Por que agora:** exemplos `vhdl-*` e todos os Bishop.

**O que saber** (detalhes em `m1-revisao-modelagem/notas/01-vhdl-essencial.md`)
- `entity`/`architecture`, `library`/`use`, `std_logic`, `numeric_std`.
- Concorrente × sequencial; `when/else`, `with/select`, `if`, `case`.
- Processo combinacional × síncrono; `rising_edge`; reset assíncrono.
- Sinal × variável; testbench com `wait for`, `assert`, `report`.

**Onde estudar:** *Free Range VHDL* cap. 1–6 e 12; Chu cap. 3–5 e 8;
Altera *Introduction to VHDL* (Basics, Processes, Synthesis).

**Autoteste**
1. O que torna `when/else` um mux com prioridade?
2. Quando um processo gera latch?
3. Por que um testbench não tem portas?
