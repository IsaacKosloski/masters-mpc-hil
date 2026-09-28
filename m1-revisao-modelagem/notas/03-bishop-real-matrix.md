# Nota 03 — Álgebra matricial em VHDL: biblioteca de Bishop

> Slides 37–46. Referência: D. Bishop, *Matrix math packages user's guide* (`real_matrix_ug.pdf`).

## 1. O que é

Pacotes que trazem ao VHDL operações de matriz no estilo MATLAB:

| Pacote | Tipos | Depende de |
|---|---|---|
| `real_matrix_pkg` | `real_matrix`, `integer_matrix` | `math_real` |
| `complex_matrix_pkg` | `complex_matrix`, … | `real_matrix_pkg`, `math_complex` |
| `fixed_matrix_pkg` | `sfixed_matrix`, `signed_matrix`, … | `real_matrix_pkg`, `fixed_pkg` |

Compilados na biblioteca `ieee_proposed` (VHDL-2008), **nesta ordem**: declaração antes do
corpo; `real` antes de `complex` e `fixed` (`.\tools\bishop.ps1`).

## 2. Declaração e índices

```
signal a : real_matrix(0 to 3, 0 to 1);   -- 4 linhas x 2 colunas
a(i, j)                                    -- linha i, coluna j, a partir de 0
```

- Use sempre faixas `0 to n-1`: com `downto` a matriz é tratada **invertida**.
- Um `real_vector` é tratado como **matriz-linha**. Matriz-coluna: `real_matrix(0 to n-1, 0 to 0)`.
- **Errata do guia:** ele afirma que em `Z := ((1,2,3),(4,5,6),(7,8,9))` vale `Z(0,2) = 7`.
  Pelas regras de agregados do VHDL o primeiro índice é a linha, logo `Z(0,2) = 3`
  (coerente com os exemplos de `submatrix` e `buildmatrix` do próprio guia).
  **Verifique no ModelSim** com `print_matrix` e registre em `docs/errata.md`.

## 3. Operações que os exemplos usam

| Matemática | Bishop | Condição |
|---|---|---|
| A·B | `a * b` | colunas(A) = linhas(B); resultado linhas(A)×colunas(B) |
| A ± B | `a + b`, `a - b` | mesmas dimensões |
| k·A | `k * a` | — |
| Aᵀ | `transpose(a)` | — |
| det A | `det(a)` | quadrada |
| A⁻¹ | `inv(a)` ou `a ** (-1)` | quadrada, det ≠ 0 |
| Aⁿ | `a ** n` | quadrada |
| I, 0, 1 | `eye(r,c)`, `zeros(r,c)`, `ones(r,c)` | — |
| recortar/montar | `submatrix`, `buildmatrix`, `InsertColumn` | ver guia |
| imprimir | `print_matrix(a)`, `to_string(a)` | só simulação |

## 4. O limite importante

`real` **não é sintetizável**: estes pacotes servem para **simular e verificar** a
matemática. Na FPGA usaremos ponto-fixo (`fixed_matrix_pkg`/`sfixed`) e arquitetura RT —
assunto da revisão R15 e da fase de implementação.

## 5. Padrão de projeto dos exemplos (slides)

`rst = '1'` carrega as constantes nas matrizes; `rst = '0'` calcula. Em t = 0 o `rst` vale
`'U'`: por isso `elsif rst = '0'` e não `else`.

## 6. "det = 0" com números reais

Contas em ponto flutuante raramente dão zero exato: use um limiar, `abs(d) > limiar`,
e justifique o valor escolhido no README.

## Autoteste

1. Qual a dimensão de `a*b` com `a` 4×2 e `b` 2×3? E `b*a`?
2. Por que `real_matrix` não vai para a FPGA?
3. Como declarar um vetor-coluna de 3 elementos?
4. Em que ordem compilar os seis arquivos da `ieee_proposed`?
