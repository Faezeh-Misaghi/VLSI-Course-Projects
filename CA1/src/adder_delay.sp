* PART2-Delay Measurement

***********LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.INCLUDE 'adders.sp'

***********PARAMETERS***********
.param    vdd_val    = 1V
.param    tr_tf      = 20p
.param    td_rise    = 2n     
.param    pw_val     = 1n
.param    per_val    = 2n
.param    td_fall    = 'td_rise + pw_val'

***********SOURCES***********
VDD    vdd    0    vdd_val
Vpulse   in_pulse   0    PULSE(0 'vdd_val' 'td_rise' 'tr_tf' 'tr_tf' 'pw_val' 'per_val')
Vhigh   in_high    0    DC    'vdd_val'
Vlow    in_low     0    DC    0V

***********INSTANTIATIONS***********
X_FA_A_A  in_pulse  in_low    in_high   S_A_pathA    C_A_pathA    vdd  0    FullAdder_A
X_FA_A_B  in_low    in_pulse  in_high   S_A_pathB    C_A_pathB    vdd  0    FullAdder_A
X_FA_A_C  in_low    in_high   in_pulse  S_A_pathC    C_A_pathC    vdd  0    FullAdder_A

X_FA_B_A  in_pulse  in_low    in_high   S_B_pathA    C_B_pathA    vdd  0    FullAdder_B
X_FA_B_B  in_low    in_pulse  in_high   S_B_pathB    C_B_pathB    vdd  0    FullAdder_B
X_FA_B_C  in_low    in_high   in_pulse  S_B_pathC    C_B_pathC    vdd  0    FullAdder_B

***********TRANSIENT ANALYSIS***********
.tran    1p    4n
.options post=2 brief nomod

***********DELAY ANALYSIS FOR S***********
.measure tran tpLH_S_A_A trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(S_A_pathA) val='vdd_val/2' rise=1
.measure tran tpHL_S_A_A trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(S_A_pathA) val='vdd_val/2' fall=1
.measure tran tpLH_S_B_A trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(S_A_pathB) val='vdd_val/2' rise=1
.measure tran tpHL_S_B_A trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(S_A_pathB) val='vdd_val/2' fall=1
.measure tran tpLH_S_C_A trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(S_A_pathC) val='vdd_val/2' rise=1
.measure tran tpHL_S_C_A trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(S_A_pathC) val='vdd_val/2' fall=1
.measure tran Tpd_S_Worst_A param='MAX( MAX( (tpLH_S_A_A + tpHL_S_A_A)/2 , (tpLH_S_B_A + tpHL_S_B_A)/2 ) , (tpLH_S_C_A + tpHL_S_C_A)/2 )'

.measure tran tpLH_S_A_B trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(S_B_pathA) val='vdd_val/2' rise=1
.measure tran tpHL_S_A_B trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(S_B_pathA) val='vdd_val/2' fall=1
.measure tran tpLH_S_B_B trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(S_B_pathB) val='vdd_val/2' rise=1
.measure tran tpHL_S_B_B trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(S_B_pathB) val='vdd_val/2' fall=1
.measure tran tpLH_S_C_B trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(S_B_pathC) val='vdd_val/2' rise=1
.measure tran tpHL_S_C_B trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(S_B_pathC) val='vdd_val/2' fall=1
.measure tran Tpd_S_Worst_B param='MAX( MAX( (tpLH_S_A_B + tpHL_S_A_B)/2 , (tpLH_S_B_B + tpHL_S_B_B)/2 ) , (tpLH_S_C_B + tpHL_S_C_B)/2 )'

***********DELAY ANALYSIS FOR Cout***********
.measure tran tpLH_C_A_A trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(C_A_pathA) val='vdd_val/2' rise=1
.measure tran tpHL_C_A_A trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(C_A_pathA) val='vdd_val/2' fall=1
.measure tran tpLH_C_B_A trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(C_A_pathB) val='vdd_val/2' rise=1
.measure tran tpHL_C_B_A trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(C_A_pathB) val='vdd_val/2' fall=1
.measure tran tpLH_C_C_A trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(C_A_pathC) val='vdd_val/2' rise=1
.measure tran tpHL_C_C_A trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(C_A_pathC) val='vdd_val/2' fall=1
.measure tran Tpd_Cout_Worst_A param='MAX( MAX( (tpLH_C_A_A + tpHL_C_A_A)/2 , (tpLH_C_B_A + tpHL_C_B_A)/2 ) , (tpLH_C_C_A + tpHL_C_C_A)/2 )'

.measure tran tpLH_C_A_B trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(C_B_pathA) val='vdd_val/2' rise=1
.measure tran tpHL_C_A_B trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(C_B_pathA) val='vdd_val/2' fall=1
.measure tran tpLH_C_B_B trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(C_B_pathB) val='vdd_val/2' rise=1
.measure tran tpHL_C_B_B trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(C_B_pathB) val='vdd_val/2' fall=1
.measure tran tpLH_C_C_B trig v(in_pulse) val='vdd_val/2' td='td_rise' rise=1 targ v(C_B_pathC) val='vdd_val/2' rise=1
.measure tran tpHL_C_C_B trig v(in_pulse) val='vdd_val/2' td='td_fall' fall=1 targ v(C_B_pathC) val='vdd_val/2' fall=1
.measure tran Tpd_Cout_Worst_B param='MAX( MAX( (tpLH_C_A_B + tpHL_C_A_B)/2 , (tpLH_C_B_B + tpHL_C_B_B)/2 ) , (tpLH_C_C_B + tpHL_C_C_B)/2 )'

***********WORST-CASE***********
.measure tran Tpd_FA_Worst_A param='MAX( Tpd_S_Worst_A , Tpd_Cout_Worst_A )'
.measure tran Tpd_FA_Worst_B param='MAX( Tpd_S_Worst_B , Tpd_Cout_Worst_B )'

.end
