* Pipelined Circuit Testbench

***********Library Inclusions***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'circuit_gate.sp'
.inc 'd_latch.sp'
.inc 'd_ff.sp'
.inc 'circuit.sp'
.inc 'circuit.sp' 

**********Power Supplies**********
VDD vdd 0 1.8V
VSS gnd 0 0V

**********Stimulation (Inputs & Clock)***********
VCLK CLK 0 PULSE(0 1.8 0 100p 100p 4.9n 10n)
VA_in A 0 PULSE(0 1.8 2n 100p 100p 15n 30n)
VB_in B 0 DC 1.8
VC_in C 0 DC 1.8
VD_in D 0 PULSE(0 1.8 2n 100p 100p 20n 40n)

**********Instantiating the Full Pipelined Chip**********
X_Pipelined_Chip CLK A B C D OUT OUT_bar vdd gnd CIRCUIT 

**********Simulation Control***********
.TRAN 100p 60n
.PROBE V(CLK) V(D) V(X_Pipelined_Chip.D_reg) V(X_Pipelined_Chip.OUT_comb) V(OUT)
.OPTION POST=2
.END