* PART1-PVT Corners And Temperature 

************LIBRARY***********
.include 'gates.sp'

*********** PARAMETERS ***********
.param vdd_val = 1V

***********SOURCES***********
Vdd    VDD    0    vdd_val
Vss    GND    0    0V

***********INPUT PULSES***********
Vin_INV    in_inv    0    PULSE(0    1.2    100p    10p    10p    500p    1n)
Vin_A    in_a      0    PULSE(0    1.2    100p    10p    10p    500p    1n)
Vin_S    in_s      0    PULSE(0    1.2    100p    10p    10p    500p    1n)

***********INSTANTIATIONS***********
X_INV    in_inv    out_inv    VDD    GND    INV
X_NAND    in_a    VDD    out_nand    VDD    GND    NAND
X_NOR    in_a    GND    out_nor    VDD    GND    NOR
X_AND    in_a    VDD    out_and    VDD    GND    AND
X_OR    in_a    GND    out_or    VDD    GND    OR
X_XOR    in_a    GND    out_xor    VDD    GND    XOR
X_MUX    VDD    GND    in_s    out_mux    VDD    GND    MUX

***********MEASUREMENTS***********
*---INV---*
.measure    tran    tphl_inv    TRIG v(in_inv) VAL='0.6' RISE=1 TARG v(out_inv) VAL='0.6' FALL=1
.measure    tran    tplh_inv    TRIG v(in_inv) VAL='0.6' FALL=1 TARG v(out_inv) VAL='0.6' RISE=1
.measure    tran    tpd_inv     PARAM='(tphl_inv + tplh_inv) / 2'

*---NAND---*
.measure    tran    tphl_nand   TRIG v(in_a) VAL='0.6' RISE=1 TARG v(out_nand) VAL='0.6' FALL=1
.measure    tran    tplh_nand   TRIG v(in_a) VAL='0.6' FALL=1 TARG v(out_nand) VAL='0.6' RISE=1
.measure    tran    tpd_nand    PARAM='(tphl_nand + tplh_nand) / 2'

*---NOR---*
.measure    tran    tphl_nor    TRIG v(in_a) VAL='0.6' RISE=1 TARG v(out_nor) VAL='0.6' FALL=1
.measure    tran    tplh_nor    TRIG v(in_a) VAL='0.6' FALL=1 TARG v(out_nor) VAL='0.6' RISE=1
.measure    tran    tpd_nor     PARAM='(tphl_nor + tplh_nor) / 2'

*---AND---*
.measure    tran    tphl_and    TRIG v(in_a) VAL='0.6' FALL=1 TARG v(out_and) VAL='0.6' FALL=1
.measure    tran    tplh_and    TRIG v(in_a) VAL='0.6' RISE=1 TARG v(out_and) VAL='0.6' RISE=1
.measure    tran    tpd_and     PARAM='(tphl_and + tplh_and) / 2'

*---OR---*
.measure    tran    tphl_or     TRIG v(in_a) VAL='0.6' FALL=1 TARG v(out_or) VAL='0.6' FALL=1
.measure    tran    tplh_or     TRIG v(in_a) VAL='0.6' RISE=1 TARG v(out_or) VAL='0.6' RISE=1
.measure    tran    tpd_or      PARAM='(tphl_or + tplh_or) / 2'

*---XOR---*
.measure    tran    tphl_xor    TRIG v(in_a) VAL='0.6' FALL=1 TARG v(out_xor) VAL='0.6' FALL=1
.measure    tran    tplh_xor    TRIG v(in_a) VAL='0.6' RISE=1 TARG v(out_xor) VAL='0.6' RISE=1
.measure    tran    tpd_xor     PARAM='(tphl_xor + tplh_xor) / 2'

*---MUX---*
.measure    tran    tphl_mux    TRIG v(in_s) VAL='0.6' RISE=1 TARG v(out_mux) VAL='0.6' FALL=1
.measure    tran    tplh_mux    TRIG v(in_s) VAL='0.6' FALL=1 TARG v(out_mux) VAL='0.6' RISE=1
.measure    tran    tpd_mux     PARAM='(tphl_mux + tplh_mux) / 2'

***********TRANSIENT ANALYSIS***********
.options    post=2    nomod
.tran    1p    2n    SWEEP temp 10 70 15

***********CORNER SIMULATIONS***********

.lib    'crn90g_2d5_lk_v1d2p1.l'    TT

.alter    corner_SS
.del lib    'crn90g_2d5_lk_v1d2p1.l'    TT
.lib    'crn90g_2d5_lk_v1d2p1.l'    SS

.alter    corner_FF
.del lib    'crn90g_2d5_lk_v1d2p1.l'    SS
.lib    'crn90g_2d5_lk_v1d2p1.l'    FF

.alter    corner_SF
.del lib    'crn90g_2d5_lk_v1d2p1.l'    FF
.lib    'crn90g_2d5_lk_v1d2p1.l'    SF

.alter    corner_FS
.del lib    'crn90g_2d5_lk_v1d2p1.l'    SF
.lib    'crn90g_2d5_lk_v1d2p1.l'    FS

.end
