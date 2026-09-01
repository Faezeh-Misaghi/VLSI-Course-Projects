* PART2 - 8-Bit Adder Waveform

************ LIBRARY ***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'adder8bit.sp'

*********** PARAMETERS ***********
.param    vdd_val = 1V
.param    tr      = 20p     
.param    tf      = 20p     

************ SOURCE ************
Vdd    vdd    0    DC    'vdd_val'

********* INSTANTIATION ***********

X_adder8  A0 A1 A2 A3 A4 A5 A6 A7  B0 B1 B2 B3 B4 B5 B6 B7  inCin  S0 S1 S2 S3 S4 S5 S6 S7  outCout  vdd  0  Adder_8Bit

********** INPUT SIGNALS ***********
V_Cin     inCin    0    DC    0V
* Input A: 
* State1(0-2ns): 255 (all 1s) | State2(2-4ns): 255 (all 1s) | State3(4-6ns): 15 (A0-A3=1, A4-A7=0)
V_A0      A0       0    DC    'vdd_val'
V_A1      A1       0    DC    'vdd_val'
V_A2      A2       0    DC    'vdd_val'
V_A3      A3       0    DC    'vdd_val'
V_A4      A4       0    PWL(0 'vdd_val'  4n 'vdd_val'  '4n+tr' 0)
V_A5      A5       0    PWL(0 'vdd_val'  4n 'vdd_val'  '4n+tr' 0)
V_A6      A6       0    PWL(0 'vdd_val'  4n 'vdd_val'  '4n+tr' 0)
V_A7      A7       0    PWL(0 'vdd_val'  4n 'vdd_val'  '4n+tr' 0)

* Input B: 
* State1(0-2ns): 0 | State2(2-4ns): 1 (B0=1, rest 0) | State3(4-6ns): 15 (B0-B3=1, rest 0)
V_B0      B0       0    PWL(0 0  2n 0  '2n+tr' 'vdd_val')
V_B1      B1       0    PWL(0 0  4n 0  '4n+tr' 'vdd_val')
V_B2      B2       0    PWL(0 0  4n 0  '4n+tr' 'vdd_val')
V_B3      B3       0    PWL(0 0  4n 0  '4n+tr' 'vdd_val')
V_B4      B4       0    DC    0V
V_B5      B5       0    DC    0V
V_B6      B6       0    DC    0V
V_B7      B7       0    DC    0V

********** TRANSIENT ANALYSIS **********
.tran    10p    6n

********** OUTPUT SETTINGS **********
.option    post=2
.print    tran    v(A0) v(A7) v(B0) v(B7) v(S0) v(S1) v(S2) v(S3) v(S4) v(S5) v(S6) v(S7) v(outCout)

.end
