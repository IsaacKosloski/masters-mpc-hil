# R04 — Laplace, transformada Z e discretização

**Por que agora:** o Exercício 1 parte de um modelo contínuo e pede período T.

**O que saber**
- Função de transferência, polos e zeros; estabilidade contínua (Re s < 0).
- Amostragem com segurador de ordem zero (ZOH).
- Mapeamento `z = e^{sT}`; estabilidade discreta (|z| < 1).
- `c2d` no MATLAB e o efeito de T.

**Onde estudar:** Ogata, *Discrete-Time Control Systems*, cap. 2–3; Wang seção 1.2
(exemplos com `c2dm` — hoje use `c2d`).

**Autoteste**
1. Polo contínuo em s = −2, T = 0,1 s: onde fica em z?
2. Um polo em z = 1 é estável?
3. O que o ZOH supõe sobre u(t) entre amostras?
