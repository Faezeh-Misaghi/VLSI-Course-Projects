* Correct Sampling Test for D-Flip-Flop

***********Library***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'd_ff.sp'

**********Power Supplies**********
VDD vdd 0 1.8V
VSS gnd 0 0V

***********Instantiating*************
X_DFF D CLK Q Q_bar vdd gnd DFF

**********Stimulation (Signals)***********
VCLK CLK 0 PULSE(0 1.8 5n 100p 100p 4.9n 10n)
VD D 0 PULSE(0 1.8 2n 100p 100p 10n 20n)

**********Simulation Control***********
.TRAN 100p 30n
.PROBE V(CLK) V(D) V(Q)
.OPTION POST=2
.END