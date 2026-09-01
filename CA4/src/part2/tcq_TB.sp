* Testbench for Measuring t_cq of D-Flip-Flop

***********Library Inclusions***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'd_ff.sp'

**********Power Supplies**********
VDD vdd 0 1.8V
VSS gnd 0 0V

***********Instantiating*************
X_MY_DFF D CLK Q Q_bar vdd gnd DFF
C_load Q 0 50f

**********Stimulation***********

VCLK CLK 0 PULSE(0 1.8 5n 50p 50p 5n 10n)
VD D 0 PULSE(0 1.8 2n 50p 50p 10n 20n)

**********Initial Conditions**********
.IC V(Q)=0 V(Q_bar)=1.8

**********Measurement**********
.MEASURE TRAN tcq_rise TRIG V(CLK) VAL=0.9 RISE=1 TARG V(Q) VAL=0.9 RISE=1
.MEASURE TRAN tcq_fall TRIG V(CLK) VAL=0.9 RISE=2 TARG V(Q) VAL=0.9 FALL=1

**********Simulation Control***********
.TRAN 1p 30n
.OPTION POST=2
.END