* 6. Time Borrowing Measurement Testbench at Max Frequency

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'circuit_gate.sp'
.inc 'd_latch.sp'
.inc 'pp_circuit.sp' 
.inc 'CLB.sp' 

********** Power Supplies **********
VDD vdd 0 1.8V
VSS gnd 0 0V

********** Initial Conditions **********
.IC V(OUT)=0
.IC V(OUT_comb)=0

*********** Instantiating *************
X_Pipeline CLK A B C D OUT OUT_bar vdd gnd CIRCUIT

********** Parameters & Clocks ***********
.PARAM T_clk = 1490p
VCLK CLK 0 PULSE(0 1.8 0 10p 10p 'T_clk/2' 'T_clk')

********** Stimulation ***********
VA A 0 DC 1.8
VC C 0 DC 0
VD D 0 DC 0

.PARAM delay_B = '0.9 * T_clk'
VB B 0 PULSE(0 1.8 'delay_B' 10p 10p '5*T_clk' '10*T_clk')

********** Advanced Time Borrowing Measurements **********

.MEASURE TRAN t_input_change WHEN V(B)=0.9 RISE=1
.MEASURE TRAN t_clk_edge WHEN V(CLK)=0.9 RISE=1
.MEASURE TRAN t_comb_ready WHEN V(OUT_comb)=0.9 RISE=1
.MEASURE TRAN t_propagation PARAM='t_comb_ready - t_input_change'
.MEASURE TRAN time_borrowed PARAM='t_comb_ready - t_clk_edge'

********** Simulation Control ***********
.TRAN 10p '3 * T_clk'
.OPTION POST=2
.END