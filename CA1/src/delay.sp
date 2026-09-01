* PART1-Delay Measurement 

************LIBRARY***********
.lib    'crn90g_2d5_lk_v1d2p1.l' TT
.include    'gates.sp'

***********PARAMETERS***********
.param    vdd_val    = 1V
.param    tr_tf    = 20p
.param    td_rise    = 2n     
.param    pw_val    = 1n
.param    per_val    = 2n
.param    td_fall    = 'td_rise + pw_val'

************SOURCE************
Vdd    vdd    0    DC    'vdd_val'

**********INPUT SIGNAL***********
Vpulse    in_pulse    0    PULSE(0 'vdd_val' 'td_rise' 'tr_tf' 'tr_tf' 'pw_val' 'per_val')
Vhigh     in_high    0    DC    'vdd_val'
Vlow    in_low    0    DC    0V

*********INSTANTIATION***********
*---INV---*
X_inv    in_pulse    out_inv    vdd    0    INV

*---NAND---*
X_nand_A    in_pulse    in_high    out_nand_A    vdd    0    NAND
X_nand_B    in_high    in_pulse    out_nand_B    vdd    0    NAND

*---NOR---*
X_nor_A    in_pulse    in_low    out_nor_A     vdd    0    NOR
X_nor_B    in_low    in_pulse    out_nor_B     vdd    0    NOR

*---AND---*
X_and_A    in_pulse    in_high     out_and_A     vdd    0    AND
X_and_B    in_high     in_pulse    out_and_B     vdd    0    AND

*---OR---*
X_or_A     in_pulse    in_low    out_or_A    vdd    0    OR
X_or_B     in_low    in_pulse    out_or_B    vdd    0    OR

*---XOR---*
X_xor_A    in_pulse    in_low    out_xor_A     vdd    0    XOR
X_xor_B    in_pulse    in_high     out_xor_B     vdd    0    XOR

*---MUX---*
X_mux_A    in_pulse    in_low    in_low    out_mux_A     vdd    0    MUX
X_mux_B    in_low    in_pulse    in_high     out_mux_B     vdd    0    MUX
X_mux_S    in_high     in_low    in_pulse    out_mux_S     vdd    0    MUX


**********DELAY ANALYSIS**********
.tran    1p    5n
.option post=2 numdgt=5

*---INV---*
.measure tran    tpLH_INV    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_inv)    val='vdd_val/2' rise=1
.measure tran    tpHL_INV    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_inv)    val='vdd_val/2' fall=1
.measure tran    Tpd_INV     param='(tpLH_INV + tpHL_INV) / 2'

*---NAND---*
.measure tran    tpLH_NAND_A    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_nand_A)    val='vdd_val/2' rise=1
.measure tran    tpHL_NAND_A    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_nand_A)    val='vdd_val/2' fall=1
.measure tran    tpLH_NAND_B    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_nand_B)    val='vdd_val/2' rise=1
.measure tran    tpHL_NAND_B    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_nand_B)    val='vdd_val/2' fall=1
.measure tran    Tpd_NAND_Worst param='MAX( (tpLH_NAND_A + tpHL_NAND_A)/2 , (tpLH_NAND_B + tpHL_NAND_B)/2 )'

*---NOR---*
.measure tran    tpLH_NOR_A    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_nor_A)    val='vdd_val/2' rise=1
.measure tran    tpHL_NOR_A    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_nor_A)    val='vdd_val/2' fall=1
.measure tran    tpLH_NOR_B    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_nor_B)    val='vdd_val/2' rise=1
.measure tran    tpHL_NOR_B    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_nor_B)    val='vdd_val/2' fall=1
.measure tran    Tpd_NOR_Worst param='MAX( (tpLH_NOR_A + tpHL_NOR_A)/2 , (tpLH_NOR_B + tpHL_NOR_B)/2 )'

*---AND---*
.measure tran    tpLH_AND_A    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_and_A)    val='vdd_val/2' rise=1
.measure tran    tpHL_AND_A    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_and_A)    val='vdd_val/2' fall=1
.measure tran    tpLH_AND_B    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_and_B)    val='vdd_val/2' rise=1
.measure tran    tpHL_AND_B    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_and_B)    val='vdd_val/2' fall=1
.measure tran    Tpd_AND_Worst param='MAX( (tpLH_AND_A + tpHL_AND_A)/2 , (tpLH_AND_B + tpHL_AND_B)/2 )'

*---OR---*
.measure tran    tpLH_OR_A    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_or_A)    val='vdd_val/2' rise=1
.measure tran    tpHL_OR_A    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_or_A)    val='vdd_val/2' fall=1
.measure tran    tpLH_OR_B    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_or_B)    val='vdd_val/2' rise=1
.measure tran    tpHL_OR_B    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_or_B)    val='vdd_val/2' fall=1
.measure tran    Tpd_OR_Worst param='MAX( (tpLH_OR_A + tpHL_OR_A)/2 , (tpLH_OR_B + tpHL_OR_B)/2 )'

*---XOR---*
.measure tran    tpLH_XOR_A    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_xor_A)    val='vdd_val/2' rise=1
.measure tran    tpHL_XOR_A    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_xor_A)    val='vdd_val/2' fall=1
.measure tran    tpLH_XOR_B    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_xor_B)    val='vdd_val/2' rise=1
.measure tran    tpHL_XOR_B    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_xor_B)    val='vdd_val/2' fall=1
.measure tran    Tpd_XOR_Worst param='MAX( (tpLH_XOR_A + tpHL_XOR_A)/2 , (tpLH_XOR_B + tpHL_XOR_B)/2 )'

*---MUX---*
.measure tran    tpLH_MUX_A    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_mux_A)    val='vdd_val/2' rise=1
.measure tran    tpHL_MUX_A    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_mux_A)    val='vdd_val/2' fall=1
.measure tran    tpLH_MUX_B    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_mux_B)    val='vdd_val/2' rise=1
.measure tran    tpHL_MUX_B    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_mux_B)    val='vdd_val/2' fall=1
.measure tran    tpLH_MUX_S    trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1    targ v(out_mux_S)    val='vdd_val/2' fall=1
.measure tran    tpHL_MUX_S    trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1    targ v(out_mux_S)    val='vdd_val/2' rise=1
.measure tran    Tpd_MUX_Worst param='MAX( MAX( (tpLH_MUX_A + tpHL_MUX_A)/2 , (tpLH_MUX_B + tpHL_MUX_B)/2 ) , (tpLH_MUX_S + tpHL_MUX_S)/2 )'

.end
