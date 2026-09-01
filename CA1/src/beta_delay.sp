* PART1-Delay Simulation with Beta 

************LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT

*********** PARAMETERS ***********
.param Lmin = 180n
.param vdd_val = 1V
.param beta = 1
.param wn_base = 1u
.param wp_var = 'beta * wn_base'

*********** POWER SUPPLY ***********
VDD    VDD    0    vdd_val
Vss    GND    0    0V

*********** INPUT SOURCES ***********
Vin    in    0    PULSE(0    vdd_val    1n    0.1n    0.1n    2n    4n)

*********** SUBCIRCUITS ***********
*---INV---*
.SUBCKT INV in out VDD GND
Mn out in GND GND nch W='wn_base' L='Lmin'
Mp out in VDD VDD pch W='wp_var'  L='Lmin'
.ENDS INV

*---NAND---*
.SUBCKT NAND inA inB out VDD GND
Mn1 out  inB net1 GND nch W='wn_base' L='Lmin'
Mn2 net1 inA GND  GND nch W='wn_base' L='Lmin'
Mp1 out  inB VDD  VDD pch W='wp_var'  L='Lmin'
Mp2 out  inA VDD  VDD pch W='wp_var'  L='Lmin'
.ENDS NAND

*---NOR---*
.SUBCKT NOR inA inB out VDD GND
Mn1 out  inA GND     GND nch W='wn_base' L='Lmin'
Mn2 out  inB GND     GND nch W='wn_base' L='Lmin'
Mp1 net_mid inA VDD  VDD pch W='wp_var'  L='Lmin'
Mp2 out  inB net_mid VDD pch W='wp_var'  L='Lmin'
.ENDS NOR

*********** INSTANTIATIONS ***********
X_INV    in    out_INV    VDD    0    INV
X_NAND    in    VDD    out_NAND    VDD    0    NAND
X_NOR    in    GND    out_NOR    VDD    0    NOR

*********** TRANSIENT ANALYSIS & SWEEP ***********
.tran    1p    5n    SWEEP    beta    1    5    1
.options    post=2    brief    nomod

*********** MEASUREMENTS (Delay Calculation) ***********
*---INV---*
.measure tran tphl_inv TRIG v(in) VAL='vdd_val/2' RISE=1 TARG v(out_INV) VAL='vdd_val/2' FALL=1
.measure tran tplh_inv TRIG v(in) VAL='vdd_val/2' FALL=1 TARG v(out_INV) VAL='vdd_val/2' RISE=1
.measure tran tpd_inv param='(tphl_inv + tplh_inv)/2'

*---NAND---*
.measure tran tphl_nand TRIG v(in) VAL='vdd_val/2' RISE=1 TARG v(out_NAND) VAL='vdd_val/2' FALL=1
.measure tran tplh_nand TRIG v(in) VAL='vdd_val/2' FALL=1 TARG v(out_NAND) VAL='vdd_val/2' RISE=1
.measure tran tpd_nand param='(tphl_nand + tplh_nand)/2'

*---NOR---*
.measure tran tphl_nor TRIG v(in) VAL='vdd_val/2' RISE=1 TARG v(out_NOR) VAL='vdd_val/2' FALL=1
.measure tran tplh_nor TRIG v(in) VAL='vdd_val/2' FALL=1 TARG v(out_NOR) VAL='vdd_val/2' RISE=1
.measure tran tpd_nor param='(tphl_nor + tplh_nor)/2'

.end
