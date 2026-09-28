# R09 — MATLAB (mínimo para as referências)

**Por que agora:** cada unidade tem `ref/gera_ref.m`, rodado em batch por `.\tools\ref.ps1`.

**O que saber**
- Matrizes: `[1 2; 3 4]`, indexação `A(i,j)` (a partir de **1**), `size`, `'` (transposta).
- `A*B` × `A.*B`; `inv`, `det`, `rank`, `eig`, `eye`, `zeros`.
- Controle: `ss`, `tf`, `c2d`, `ctrb`, `poly`, `polyvalm`, `acker`, `place`.
- Script × função; `addpath`; `fprintf`/`disp`.
- `matlab -batch "comando"` (sem janela, devolve código de saída).

**Onde estudar:** *MATLAB Onramp* (gratuito, ~2 h); documentação de `c2d` e `acker`.

**Autoteste**
1. Diferença entre `A*B` e `A.*B`?
2. MATLAB indexa a partir de 1, Bishop a partir de 0: onde isso pode enganar?
3. Como rodar um script sem abrir a interface?
