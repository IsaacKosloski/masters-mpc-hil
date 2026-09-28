# Como montar e resolver uma unidade (exemplo ou exercício)

Roteiro igual para todas. Faça na ordem; não pule o passo 3.

1. **Criar a pasta**
   ```powershell
   Copy-Item .\templates\unit .\m1-revisao-modelagem\exemplos\bishop-01-multiplicacao -Recurse
   git switch -c feat/m1-bishop-01
   ```
2. **README.md** — copie o enunciado com suas palavras, o nº do slide e o que o exemplo
   exercita. Se não souber escrever o que ele exercita, volte à nota.
3. **Referência antes do hardware** — em `ref/gera_ref.m`: dados do slide + resultado
   esperado calculado no MATLAB. Rode `.\tools\ref.ps1 <unidade>` e confira à mão um
   elemento do resultado.
4. **Entidade** — defina só as portas: o que entra, o que sai, de que tipo e tamanho.
   Desenhe o bloco no papel antes.
5. **Arquitetura** — descreva o comportamento pedido. Pergunte-se: é combinacional
   (lista de sensibilidade completa) ou síncrono (`rising_edge`)? Que valor as saídas
   têm durante o reset?
6. **Testbench** — gere estímulos na ordem do enunciado, compare com `ref_pkg` usando
   `tb_util_pkg.compara` e escreva o total em `falhas`.
7. **Manifesto** — liste os arquivos em ordem de dependência (pacotes antes de quem usa).
8. **Rodar** — `.\tools\sim.ps1 <unidade>` até PASS; depois `-Gui` e observe as ondas.
9. **Provar que o teste pega erro** — altere de propósito um valor esperado, veja FAIL,
   desfaça.
10. **Commit** — `feat(m1): adiciona exemplo bishop-01 (multiplicação)`; PR.

## O que cada exemplo treina (dicas, não soluções)

| Unidade | Treina | Pergunta-guia |
|---|---|---|
| vhdl-01 circuito lógico | atribuição concorrente, operadores lógicos | o que o "Create HDL" do Quartus gera e o que sobra dele? |
| vhdl-02 mux prioridade | `if/elsif` × `when/else` | por que a ordem das condições define a prioridade? |
| vhdl-03 flip-flop D | processo síncrono, reset, enable | quais sinais vão na lista de sensibilidade de um FF com reset assíncrono? |
| bishop-01 | `*` de matrizes | quais dimensões tornam `a*b` válido e qual a dimensão do resultado? |
| bishop-02..04 | operadores/funções da `real_matrix_pkg` | qual função do guia do Bishop faz isso? |
| bishop-05/06 | `det`, `inv`, decisão | como decidir "det = 0" com números reais? |
| bishop-07/08 | lei de controle `u = -Kx` com matrizes | quem é vetor-linha e quem é vetor-coluna? |
| exr-01 | Ackermann | quais matrizes você precisa montar antes de aplicar a fórmula? |
