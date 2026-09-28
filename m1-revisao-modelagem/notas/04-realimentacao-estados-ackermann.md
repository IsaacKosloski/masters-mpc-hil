# Nota 04 — Realimentação de estados e fórmula de Ackermann (tempo discreto)

> Slides 47–49. Livros: Wang, *MPC System Design…*, seção 1.1–1.2 (modelos em espaço de
> estados discretos). Ackermann não está nos livros do projeto: Ogata, *Discrete-Time
> Control Systems*, cap. 6 (alocação de polos); Nise, *Control Systems Engineering*, cap. 12.

## 1. Modelo discreto

```
x(k+1) = G x(k) + H u(k)
y(k)   = C x(k)
```

Obtido do modelo contínuo (A, B) com segurador de ordem zero e período T:
`G = e^{AT}`, `H = (∫₀ᵀ e^{Aτ} dτ) B`. No MATLAB: `c2d(ss(A,B,C,D), T)`.
Quanto menor T, mais G se aproxima de I + AT.

## 2. Lei de controle

`u(k) = -K x(k)` ⇒ malha fechada `x(k+1) = (G - HK) x(k)`.
Os **autovalores de (G − HK)** são os polos de malha fechada: escolher K = escolher polos.
Estável ⇔ todos os polos **dentro do círculo unitário** (|z| < 1).

## 3. Controlabilidade (pré-condição)

`W = [H  GH  G²H  …  G^{n-1}H]`. Só é possível alocar os polos livremente se
`posto(W) = n` (W invertível no caso de uma entrada). MATLAB: `ctrb(G,H)`, `rank`.

## 4. Fórmula de Ackermann (uma entrada)

Dado o polinômio característico desejado `φ(z) = zⁿ + α₁zⁿ⁻¹ + … + αₙ`:

```
K = [0 0 … 0 1] · W⁻¹ · φ(G),     φ(G) = Gⁿ + α₁Gⁿ⁻¹ + … + αₙ I
```

Receita:
1. Montar G e H (e checar controlabilidade).
2. Escrever φ(z) a partir dos polos desejados: `φ(z) = Π (z − zᵢ)`; MATLAB `poly(p)`.
3. Calcular φ(G) (polinômio **de matriz**: potências de G, não elemento a elemento;
   MATLAB `polyvalm`).
4. Aplicar a fórmula. Conferir: `eig(G - H*K)` deve dar os polos escolhidos;
   MATLAB `acker(G,H,p)` dá o mesmo K.

## 5. Ponte com o hardware (Exercício 1)

Cada passo acima é uma operação da `real_matrix_pkg` (`*`, `**`, `+`, `inv`, `eye`).
O período T entra na construção de G e H — deixe-o como **parâmetro** (generic ou
constante gerada no `dados_pkg`), não como número fixo.

## 6. Satélite (modelo de referência)

Controle de atitude de satélite é o exemplo clássico de **duplo integrador** (Ogata;
Franklin & Powell): a entrada é torque, os estados são ângulo e velocidade angular.
Use as matrizes e os polos **do enunciado do slide 49**; confira no MATLAB antes do VHDL.

## Autoteste

1. Por que a controlabilidade vem antes de Ackermann?
2. O que muda em G e H quando T dobra?
3. Como verificar, sem olhar o K, que o projeto está certo?
4. Por que φ(G) não é "aplicar φ em cada elemento de G"?
