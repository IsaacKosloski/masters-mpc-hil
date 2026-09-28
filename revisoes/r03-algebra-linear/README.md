# R03 — Álgebra linear (mínimo para o M1)

**Por que agora:** todos os exemplos Bishop e a fórmula de Ackermann são contas de matriz.

**O que saber**
- Produto: dimensões compatíveis, não comutativo (AB ≠ BA).
- Transposta, identidade, matriz nula.
- Determinante (2×2 e 3×3 à mão), inversa existe ⇔ det ≠ 0, `(AB)⁻¹ = B⁻¹A⁻¹`.
- Posto; vetores linearmente independentes.
- Autovalores: `det(λI − A) = 0`; polinômio característico.
- Potência e polinômio de matriz (`A² = A·A`, não elemento a elemento).

**Onde estudar:** 3Blue1Brown, *Essence of Linear Algebra* (ep. 1–7, 14); Strang,
*Introduction to Linear Algebra*, cap. 2 e 5–6.

**Autoteste**
1. A (4×2), B (2×3): dimensões de AB? BA existe?
2. det de [[1,2],[3,4]]? E a inversa?
3. Autovalores de [[2,0],[0,3]]? E de [[1,1],[0,1]]?
4. Se det(A) = 0, o que se conclui sobre as colunas de A?
