# R14 — Tcl (mínimo para `.do` e manifestos)

**Por que agora:** `manifest.tcl`, `common/tcl/*.tcl` e scripts do Quartus são Tcl.

**O que saber**
- Tudo é comando + palavras: `set x 10`, `puts $x`.
- Substituição: `$var`, `[comando]`; chaves `{…}` não substituem, aspas `"…"` substituem.
- Listas: `list`, `lappend`, `foreach f $lista { … }`.
- `if {…} { … } else { … }`, `expr {…}`.
- Arquivos: `file join`, `file exists`, `file mkdir`, `source`.
- Ambiente: `$::env(NOME)`.

**Onde estudar:** tutorial oficial em tcl-lang.org (lições 1–20);
leia `common/tcl/sim.tcl` linha a linha.

**Autoteste**
1. Diferença entre `puts {$x}` e `puts "$x"`?
2. Como percorrer os arquivos de `$fontes` compilando cada um?
3. O que `[file join $raiz common tcl]` devolve no Windows?
