# R13 — Quartus e ModelSim pela linha de comando

**Por que agora:** simular (ModelSim) todos os exemplos e levar os `vhdl-*` à placa (Quartus).

**O que saber**
- ModelSim: `vlib`, `vmap`, `vcom -2008`, `vsim`, `add wave`, `force`, `run`, `do`, `quit -code`
  (ver nota 02).
- Quartus por Tcl: `quartus_sh -t script.tcl` com `project_new`,
  `set_global_assignment -name FAMILY/DEVICE/TOP_LEVEL_ENTITY/VHDL_FILE`,
  `set_location_assignment` (pinos da DE10-Lite), `execute_flow -compile`;
  gravação: `quartus_pgm -c USB-Blaster -m JTAG -o "p;arquivo.sof"`.
- DE10-Lite: FPGA `10M50DAF484C7G`; pinos no manual da Terasic.

**Onde estudar:** Altera *Designing with Quartus II* (projeto, pinos, compilação,
programação — nomes atualizados no Quartus Prime); *Quartus Prime Scripting Reference
Manual*; manual da DE10-Lite.

**Autoteste**
1. Qual comando cria o projeto e qual compila?
2. Onde ficam as atribuições de pino num projeto Quartus?
3. Por que o `.sof` não vai para o git?
