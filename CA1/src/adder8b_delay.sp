* PART3- 8-Bit Adder Worst-Case Delay Measurement

************LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'adder8bit.sp'

***********PARAMETERS***********
.param    vdd_val = 1V
.param    tr_val  = 20p     
.param    tf_val  = 20p     

************SOURCE************
Vdd    vdd    0    DC    'vdd_val'

*********INSTANTIATION***********
X_adder8b a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7 Cin s0 s1 s2 s3 s4 s5 s6 s7 Cout vdd 0 adder_8bit

**********INPUT SIGNAL***********
* Set A = 255 (All bits = 1)
V_A0    a0    0    DC    'vdd_val'
V_A1    a1    0    DC    'vdd_val'
V_A2    a2    0    DC    'vdd_val'
V_A3    a3    0    DC    'vdd_val'
V_A4    a4    0    DC    'vdd_val'
V_A5    a5    0    DC    'vdd_val'
V_A6    a6    0    DC    'vdd_val'
V_A7    a7    0    DC    'vdd_val'

* Set B1 to B7 = 0
V_B1    b1    0    DC    0
V_B2    b2    0    DC    0
V_B3    b3    0    DC    0
V_B4    b4    0    DC    0
V_B5    b5    0    DC    0
V_B6    b6    0    DC    0
V_B7    b7    0    DC    0

V_Cin   Cin   0    DC    0

V_B0    b0    0    PULSE(0    'vdd_val'    1n    'tr_val'    'tf_val'    4n    8n)

**********TRANSIENT ANALYSIS**********
.tran    1p    4n

**********MEASUREMENTS**********
.measure    tran    delay_sum_worst    TRIG    v(b0)    VAL=0.5    RISE=1    TARG    v(s7)    VAL=0.5    FALL=1
.measure    tran    delay_carry_worst    TRIG    v(b0)    VAL=0.5    RISE=1    TARG    v(Cout)    VAL=0.5    RISE=1

**********OUTPUT SETTINGS**********
.option    post=2
.print     tran    v(b0)    v(s7)    v(Cout)

.end
