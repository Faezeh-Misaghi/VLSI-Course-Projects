* PART1-WaveForm 

************LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'gates.sp'

***********PARAMETERS***********
.param    vdd_val = 1V
.param    tr_val = 20p     
.param    tf_val = 20p     
.param    per1   = 2n      
.param    per2   = 4n    
.param    perS   = 8n      

************SOURCE************
Vdd    vdd    0    DC    'vdd_val'

*********INSTANTIATION***********
X_inv    in1    out_inv    vdd    0    INV
X_nand    in1    in2    out_nand    vdd    0    NAND
X_and     in1    in2    out_and    vdd    0    AND
X_nor    in1    in2    out_nor    vdd    0    NOR
X_or    in1    in2    out_or     vdd    0    OR
X_xor    in1    in2    out_xor    vdd    0    XOR
X_mux    in1    in2    inS    out_mux    vdd    0    MUX

**********INPUT SIGNAL***********
V_in1    in1    0    PULSE(0    'vdd_val'    0           'tr_val'    'tf_val'    'per1/2'          'per1')
V_in2    in2    0    PULSE(0    'vdd_val'    'per1/4'    'tr_val'    'tf_val'    'per2/2'          'per2')
V_sel    inS    0    PULSE(0    'vdd_val'    0           'tr_val'    'tf_val'    'perS/2'          'perS')

**********TRANSIENT ANALYSIS**********
.tran    10p    8n

**********OUTPUT SETTINGS**********
.option    post=2
.print    tran    v(in1)    v(in2)    v(inS)    v(out_inv)    v(out_nand)    v(out_and)    v(out_nor)    v(out_or)    v(out_xor)    v(out_mux)
.end
