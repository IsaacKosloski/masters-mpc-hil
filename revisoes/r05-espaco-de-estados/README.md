# R05 — Espaço de estados

**Por que agora:** `u = −Kx`, controlabilidade e Ackermann (slides 47–49), e toda a base do MPC.

**O que saber**
- Da EDO ao modelo `ẋ = Ax + Bu`, `y = Cx + Du` (ex.: RLC dos slides).
- Discreto: `x(k+1) = Gx(k) + Hu(k)`.
- Matriz de controlabilidade `[H GH … Gⁿ⁻¹H]` e observabilidade.
- Realimentação de estados e alocação de polos; Ackermann.

**Onde estudar:** Nise cap. 3 e 12; Ogata (tempo discreto) cap. 5–6; Wang seções 1.1–1.2.

**Autoteste**
1. Escreva o RLC série em espaço de estados (estados: corrente e tensão no capacitor).
2. Monte W para n = 2 e diga quando ela é invertível.
3. Com `u = −Kx`, qual matriz define os polos de malha fechada?
