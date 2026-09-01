*  Sampling Failure Scenario 

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

********** Parameters ***********
.PARAM T_clk = 600p
VCLK CLK 0 PULSE(0 1.8 'T_clk' 10p 10p 'T_clk/2' 'T_clk')

********** Stimulation ***********
VA A 0 DC 1.8
VC C 0 DC 0
VD D 0 DC 0
VB B 0 PULSE(0 1.8 'T_clk/2' 10p 10p '5*T_clk' '10*T_clk')

********** Plotting **********
.PROBE TRAN V(CLK) V(B) V(OUT)

********** Simulation Control ***********
.TRAN 1p '5 * T_clk' 
.OPTION POST=2
.END