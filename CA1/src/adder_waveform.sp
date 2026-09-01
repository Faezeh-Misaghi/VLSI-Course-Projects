* PART2-Adders WaveForm

************LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'adders.sp'

***********PARAMETERS***********
.param    vdd_val = 1V
.param    tr_val = 20p     
.param    tf_val = 20p     
.param    per1   = 2n      
.param    per2   = 4n    
.param    per3   = 8n      

************SOURCE************
Vdd    vdd    0    DC    'vdd_val'

*********INSTANTIATION***********
X_fa_a    inA    inB    inCin    outS_A    outC_A    vdd    0    FullAdder_A
X_fa_b    inA    inB    inCin    outS_B    outC_B    vdd    0    FullAdder_B

**********INPUT SIGNAL***********
V_inCin   inCin  0    PULSE(0    'vdd_val'    0    'tr_val'    'tf_val'    'per1/2'    'per1')
V_inB     inB    0    PULSE(0    'vdd_val'    0    'tr_val'    'tf_val'    'per2/2'    'per2')
V_inA     inA    0    PULSE(0    'vdd_val'    0    'tr_val'    'tf_val'    'per3/2'    'per3')

**********TRANSIENT ANALYSIS**********
.tran    10p    8n

**********OUTPUT SETTINGS**********
.option    post=2
.print    tran    v(inA)    v(inB)    v(inCin)    v(outS_A)    v(outC_A)    v(outS_B)    v(outC_B)

.end
