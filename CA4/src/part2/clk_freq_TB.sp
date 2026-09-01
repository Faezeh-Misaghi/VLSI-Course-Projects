* 4. Maximum Clock Frequency (f_max) Testbench for Pipelined Circuit

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'd_ff.sp'
.inc 'CLB_gate.sp'
.inc 'CLB.sp' 
.inc 'circuit.sp' 

********** Power Supplies **********
VDD vdd 0 1.8V
VSS gnd 0 0V

********** Initial Conditions **********
.IC V(OUT)=0

*********** Instantiating *************
X_Pipeline CLK A B C D OUT OUT_bar vdd gnd CIRCUIT


********** Parameters & Clocks ***********
.PARAM T_clk = 1500p
VCLK CLK 0 PULSE(0 1.8 'T_clk' 10p 10p 'T_clk/2' 'T_clk')

********** Stimulation ***********
VA A 0 DC 1.8
VC C 0 DC 0
VD D 0 DC 0
VB B 0 PULSE(0 1.8 'T_clk/2' 10p 10p '5*T_clk' '10*T_clk')

********** Measurement **********
.MEASURE TRAN V_OUT_CHECK FIND V(OUT) AT='2.2 * T_clk'

********** Simulation Control ***********
.TRAN 10p '3 * T_clk' SWEEP T_clk 1500p 1000p -10p
.OPTION POST=2
.END