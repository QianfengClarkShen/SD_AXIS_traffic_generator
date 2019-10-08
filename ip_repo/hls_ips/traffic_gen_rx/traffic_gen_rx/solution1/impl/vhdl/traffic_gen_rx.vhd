-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity traffic_gen_rx is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    from_app_tdata_V : IN STD_LOGIC_VECTOR (511 downto 0);
    from_app_tkeep_V : IN STD_LOGIC_VECTOR (63 downto 0);
    from_app_tlast_V : IN STD_LOGIC_VECTOR (0 downto 0);
    from_app_tvalid_V : IN STD_LOGIC_VECTOR (0 downto 0);
    from_app_tready_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    from_cmp_fifo_tdata_V : IN STD_LOGIC_VECTOR (511 downto 0);
    from_cmp_fifo_tkeep_V : IN STD_LOGIC_VECTOR (63 downto 0);
    from_cmp_fifo_tlast_V : IN STD_LOGIC_VECTOR (0 downto 0);
    from_cmp_fifo_tvalid_V : IN STD_LOGIC_VECTOR (0 downto 0);
    from_cmp_fifo_tready_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    time_cnt_V : IN STD_LOGIC_VECTOR (31 downto 0);
    mismatch_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    rx_timeElapse_V : OUT STD_LOGIC_VECTOR (31 downto 0);
    rx_timestamp_sum_V : OUT STD_LOGIC_VECTOR (63 downto 0);
    pkt_cnt_rx_V : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of traffic_gen_rx is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "traffic_gen_rx,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu19eg-ffvc1760-2-i,HLS_INPUT_CLOCK=3.103000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.715000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=163,HLS_SYN_LUT=1511,HLS_VERSION=2019_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_3D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111101";
    constant ap_const_lv32_3C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111100";
    constant ap_const_lv32_3B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111011";
    constant ap_const_lv32_3A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111010";
    constant ap_const_lv32_39 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111001";
    constant ap_const_lv32_38 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111000";
    constant ap_const_lv32_37 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110111";
    constant ap_const_lv32_36 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110110";
    constant ap_const_lv32_35 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110101";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_33 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110011";
    constant ap_const_lv32_32 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110010";
    constant ap_const_lv32_31 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110001";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_2E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101110";
    constant ap_const_lv32_2D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101101";
    constant ap_const_lv32_2C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101100";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";
    constant ap_const_lv32_2A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101010";
    constant ap_const_lv32_29 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101001";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_26 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100110";
    constant ap_const_lv32_25 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100101";
    constant ap_const_lv32_24 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100100";
    constant ap_const_lv32_23 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100011";
    constant ap_const_lv32_22 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100010";
    constant ap_const_lv32_21 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100001";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_1D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011101";
    constant ap_const_lv32_1C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011100";
    constant ap_const_lv32_1B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011011";
    constant ap_const_lv32_1A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011010";
    constant ap_const_lv32_19 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011001";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv32_12 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010010";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal rx_timeElapse_reg_V : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal rx_timestamp_sum_reg : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal pkt_cnt_rx_reg_V : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal rx_start_V : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal start_initialized_V : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal mismatch_reg_V : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal sub_ln214_fu_333_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ret_V_fu_323_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln700_fu_349_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln700_1_fu_361_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal start_initialized_V_s_load_fu_373_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal lhs_V_read_fu_237_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln883_1_fu_1566_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln883_1_fu_1560_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln883_fu_1554_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal from_cmp_fifo_tvalid_read_fu_278_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln700_fu_345_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_2_fu_406_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_422_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_4_fu_438_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_fu_454_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_fu_470_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_fu_486_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_fu_502_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_9_fu_518_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_10_fu_534_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_11_fu_550_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_fu_566_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_13_fu_582_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_14_fu_598_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_15_fu_614_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_16_fu_630_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_17_fu_646_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_18_fu_662_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_19_fu_678_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_20_fu_694_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_21_fu_710_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_22_fu_726_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_23_fu_742_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_24_fu_758_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_25_fu_774_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_26_fu_790_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_27_fu_806_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_28_fu_822_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_29_fu_838_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_30_fu_854_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_31_fu_870_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_32_fu_886_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_33_fu_902_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_34_fu_918_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_35_fu_934_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_36_fu_950_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_37_fu_966_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_38_fu_982_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_39_fu_998_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_40_fu_1014_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_41_fu_1030_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_42_fu_1046_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_43_fu_1062_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_44_fu_1078_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_45_fu_1094_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_46_fu_1110_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_47_fu_1126_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_48_fu_1142_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_49_fu_1158_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_50_fu_1174_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_51_fu_1190_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_52_fu_1206_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_53_fu_1222_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_54_fu_1238_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_55_fu_1254_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_56_fu_1270_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_57_fu_1286_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_58_fu_1302_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_59_fu_1318_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_60_fu_1334_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_61_fu_1350_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_62_fu_1366_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_63_fu_1382_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln791_fu_394_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_398_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln5_fu_414_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln6_fu_430_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln7_fu_446_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln8_fu_462_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln9_fu_478_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln10_fu_494_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln11_fu_510_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln12_fu_526_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln13_fu_542_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln14_fu_558_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln15_fu_574_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln16_fu_590_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln17_fu_606_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln18_fu_622_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln19_fu_638_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln20_fu_654_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln21_fu_670_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln22_fu_686_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln23_fu_702_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln24_fu_718_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln25_fu_734_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln26_fu_750_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln27_fu_766_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln28_fu_782_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln29_fu_798_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln30_fu_814_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln31_fu_830_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln32_fu_846_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln33_fu_862_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln34_fu_878_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln35_fu_894_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln36_fu_910_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln37_fu_926_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln38_fu_942_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln39_fu_958_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln40_fu_974_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln41_fu_990_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln42_fu_1006_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln43_fu_1022_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln44_fu_1038_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln45_fu_1054_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln46_fu_1070_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln47_fu_1086_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln48_fu_1102_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln49_fu_1118_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln50_fu_1134_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln51_fu_1150_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln52_fu_1166_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln53_fu_1182_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln54_fu_1198_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln55_fu_1214_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln56_fu_1230_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln57_fu_1246_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln58_fu_1262_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln59_fu_1278_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln60_fu_1294_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln61_fu_1310_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln62_fu_1326_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln63_fu_1342_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln64_fu_1358_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln65_fu_1374_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln66_fu_1390_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal select_ln67_fu_1398_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_fu_1406_p65 : STD_LOGIC_VECTOR (504 downto 0);
    signal xor_ln883_fu_1542_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_s_fu_1538_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal and_ln883_fu_1548_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    mismatch_reg_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                mismatch_reg_V <= ap_const_lv1_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (((((lhs_V_read_fu_237_p2 = ap_const_lv1_1) and (icmp_ln883_1_fu_1560_p2 = ap_const_lv1_0)) or ((xor_ln883_1_fu_1566_p2 = ap_const_lv1_1) and (lhs_V_read_fu_237_p2 = ap_const_lv1_1))) or ((lhs_V_read_fu_237_p2 = ap_const_lv1_1) and (icmp_ln883_fu_1554_p2 = ap_const_lv1_0))) or ((lhs_V_read_fu_237_p2 = ap_const_lv1_1) and (from_cmp_fifo_tvalid_read_fu_278_p2 = ap_const_lv1_0))))) then 
                    mismatch_reg_V <= ap_const_lv1_1;
                end if; 
            end if;
        end if;
    end process;


    pkt_cnt_rx_reg_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                pkt_cnt_rx_reg_V <= ap_const_lv32_0;
            else
                if (((ret_V_fu_323_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    pkt_cnt_rx_reg_V <= add_ln700_1_fu_361_p2;
                end if; 
            end if;
        end if;
    end process;


    rx_start_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                rx_start_V <= ap_const_lv32_0;
            else
                if (((start_initialized_V_s_load_fu_373_p1 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    rx_start_V <= time_cnt_V;
                end if; 
            end if;
        end if;
    end process;


    rx_timeElapse_reg_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                rx_timeElapse_reg_V <= ap_const_lv32_0;
            else
                if (((ret_V_fu_323_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    rx_timeElapse_reg_V <= sub_ln214_fu_333_p2;
                end if; 
            end if;
        end if;
    end process;


    rx_timestamp_sum_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                rx_timestamp_sum_reg <= ap_const_lv64_0;
            else
                if (((ret_V_fu_323_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    rx_timestamp_sum_reg <= add_ln700_fu_349_p2;
                end if; 
            end if;
        end if;
    end process;


    start_initialized_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_initialized_V <= ap_const_lv1_0;
            else
                if (((lhs_V_read_fu_237_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    start_initialized_V <= ap_const_lv1_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln700_1_fu_361_p2 <= std_logic_vector(unsigned(pkt_cnt_rx_reg_V) + unsigned(ap_const_lv32_1));
    add_ln700_fu_349_p2 <= std_logic_vector(unsigned(rx_timestamp_sum_reg) + unsigned(zext_ln700_fu_345_p1));
    and_ln883_fu_1548_p2 <= (xor_ln883_fu_1542_p2 and p_Result_s_fu_1538_p1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    from_app_tready_V <= ap_const_lv1_1;
    from_cmp_fifo_tready_V <= from_app_tvalid_V;
    from_cmp_fifo_tvalid_read_fu_278_p2 <= from_cmp_fifo_tvalid_V;
    icmp_ln883_1_fu_1560_p2 <= "1" when (from_app_tkeep_V = from_cmp_fifo_tkeep_V) else "0";
    icmp_ln883_fu_1554_p2 <= "1" when (and_ln883_fu_1548_p2 = ap_const_lv512_lc_1) else "0";
    lhs_V_read_fu_237_p2 <= from_app_tvalid_V;
    mismatch_V <= mismatch_reg_V;
        p_Result_s_fu_1538_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_fu_1406_p65),512));

    pkt_cnt_rx_V <= pkt_cnt_rx_reg_V;
    ret_V_fu_323_p2 <= (from_app_tvalid_V and from_app_tlast_V);
    rx_timeElapse_V <= rx_timeElapse_reg_V;
    rx_timestamp_sum_V <= rx_timestamp_sum_reg;
    select_ln10_fu_494_p3 <= 
        ap_const_lv8_FF when (tmp_7_fu_486_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln11_fu_510_p3 <= 
        ap_const_lv8_FF when (tmp_8_fu_502_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln12_fu_526_p3 <= 
        ap_const_lv8_FF when (tmp_9_fu_518_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln13_fu_542_p3 <= 
        ap_const_lv8_FF when (tmp_10_fu_534_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln14_fu_558_p3 <= 
        ap_const_lv8_FF when (tmp_11_fu_550_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln15_fu_574_p3 <= 
        ap_const_lv8_FF when (tmp_12_fu_566_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln16_fu_590_p3 <= 
        ap_const_lv8_FF when (tmp_13_fu_582_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln17_fu_606_p3 <= 
        ap_const_lv8_FF when (tmp_14_fu_598_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln18_fu_622_p3 <= 
        ap_const_lv8_FF when (tmp_15_fu_614_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln19_fu_638_p3 <= 
        ap_const_lv8_FF when (tmp_16_fu_630_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln20_fu_654_p3 <= 
        ap_const_lv8_FF when (tmp_17_fu_646_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln21_fu_670_p3 <= 
        ap_const_lv8_FF when (tmp_18_fu_662_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln22_fu_686_p3 <= 
        ap_const_lv8_FF when (tmp_19_fu_678_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln23_fu_702_p3 <= 
        ap_const_lv8_FF when (tmp_20_fu_694_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln24_fu_718_p3 <= 
        ap_const_lv8_FF when (tmp_21_fu_710_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln25_fu_734_p3 <= 
        ap_const_lv8_FF when (tmp_22_fu_726_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln26_fu_750_p3 <= 
        ap_const_lv8_FF when (tmp_23_fu_742_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln27_fu_766_p3 <= 
        ap_const_lv8_FF when (tmp_24_fu_758_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln28_fu_782_p3 <= 
        ap_const_lv8_FF when (tmp_25_fu_774_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln29_fu_798_p3 <= 
        ap_const_lv8_FF when (tmp_26_fu_790_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln30_fu_814_p3 <= 
        ap_const_lv8_FF when (tmp_27_fu_806_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln31_fu_830_p3 <= 
        ap_const_lv8_FF when (tmp_28_fu_822_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln32_fu_846_p3 <= 
        ap_const_lv8_FF when (tmp_29_fu_838_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln33_fu_862_p3 <= 
        ap_const_lv8_FF when (tmp_30_fu_854_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln34_fu_878_p3 <= 
        ap_const_lv8_FF when (tmp_31_fu_870_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln35_fu_894_p3 <= 
        ap_const_lv8_FF when (tmp_32_fu_886_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln36_fu_910_p3 <= 
        ap_const_lv8_FF when (tmp_33_fu_902_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln37_fu_926_p3 <= 
        ap_const_lv8_FF when (tmp_34_fu_918_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln38_fu_942_p3 <= 
        ap_const_lv8_FF when (tmp_35_fu_934_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln39_fu_958_p3 <= 
        ap_const_lv8_FF when (tmp_36_fu_950_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln40_fu_974_p3 <= 
        ap_const_lv8_FF when (tmp_37_fu_966_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln41_fu_990_p3 <= 
        ap_const_lv8_FF when (tmp_38_fu_982_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln42_fu_1006_p3 <= 
        ap_const_lv8_FF when (tmp_39_fu_998_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln43_fu_1022_p3 <= 
        ap_const_lv8_FF when (tmp_40_fu_1014_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln44_fu_1038_p3 <= 
        ap_const_lv8_FF when (tmp_41_fu_1030_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln45_fu_1054_p3 <= 
        ap_const_lv8_FF when (tmp_42_fu_1046_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln46_fu_1070_p3 <= 
        ap_const_lv8_FF when (tmp_43_fu_1062_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln47_fu_1086_p3 <= 
        ap_const_lv8_FF when (tmp_44_fu_1078_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln48_fu_1102_p3 <= 
        ap_const_lv8_FF when (tmp_45_fu_1094_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln49_fu_1118_p3 <= 
        ap_const_lv8_FF when (tmp_46_fu_1110_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln50_fu_1134_p3 <= 
        ap_const_lv8_FF when (tmp_47_fu_1126_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln51_fu_1150_p3 <= 
        ap_const_lv8_FF when (tmp_48_fu_1142_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln52_fu_1166_p3 <= 
        ap_const_lv8_FF when (tmp_49_fu_1158_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln53_fu_1182_p3 <= 
        ap_const_lv8_FF when (tmp_50_fu_1174_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln54_fu_1198_p3 <= 
        ap_const_lv8_FF when (tmp_51_fu_1190_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln55_fu_1214_p3 <= 
        ap_const_lv8_FF when (tmp_52_fu_1206_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln56_fu_1230_p3 <= 
        ap_const_lv8_FF when (tmp_53_fu_1222_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln57_fu_1246_p3 <= 
        ap_const_lv8_FF when (tmp_54_fu_1238_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln58_fu_1262_p3 <= 
        ap_const_lv8_FF when (tmp_55_fu_1254_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln59_fu_1278_p3 <= 
        ap_const_lv8_FF when (tmp_56_fu_1270_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln5_fu_414_p3 <= 
        ap_const_lv8_FF when (tmp_2_fu_406_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln60_fu_1294_p3 <= 
        ap_const_lv8_FF when (tmp_57_fu_1286_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln61_fu_1310_p3 <= 
        ap_const_lv8_FF when (tmp_58_fu_1302_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln62_fu_1326_p3 <= 
        ap_const_lv8_FF when (tmp_59_fu_1318_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln63_fu_1342_p3 <= 
        ap_const_lv8_FF when (tmp_60_fu_1334_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln64_fu_1358_p3 <= 
        ap_const_lv8_FF when (tmp_61_fu_1350_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln65_fu_1374_p3 <= 
        ap_const_lv8_FF when (tmp_62_fu_1366_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln66_fu_1390_p3 <= 
        ap_const_lv8_FF when (tmp_63_fu_1382_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln67_fu_1398_p3 <= 
        ap_const_lv8_FF when (trunc_ln791_fu_394_p1(0) = '1') else 
        ap_const_lv8_0;
    select_ln6_fu_430_p3 <= 
        ap_const_lv8_FF when (tmp_3_fu_422_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln7_fu_446_p3 <= 
        ap_const_lv8_FF when (tmp_4_fu_438_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln8_fu_462_p3 <= 
        ap_const_lv8_FF when (tmp_5_fu_454_p3(0) = '1') else 
        ap_const_lv8_0;
    select_ln9_fu_478_p3 <= 
        ap_const_lv8_FF when (tmp_6_fu_470_p3(0) = '1') else 
        ap_const_lv8_0;
    start_initialized_V_s_load_fu_373_p1 <= start_initialized_V;
    sub_ln214_fu_333_p2 <= std_logic_vector(unsigned(time_cnt_V) - unsigned(rx_start_V));
    tmp_10_fu_534_p3 <= from_cmp_fifo_tkeep_V(54 downto 54);
    tmp_11_fu_550_p3 <= from_cmp_fifo_tkeep_V(53 downto 53);
    tmp_12_fu_566_p3 <= from_cmp_fifo_tkeep_V(52 downto 52);
    tmp_13_fu_582_p3 <= from_cmp_fifo_tkeep_V(51 downto 51);
    tmp_14_fu_598_p3 <= from_cmp_fifo_tkeep_V(50 downto 50);
    tmp_15_fu_614_p3 <= from_cmp_fifo_tkeep_V(49 downto 49);
    tmp_16_fu_630_p3 <= from_cmp_fifo_tkeep_V(48 downto 48);
    tmp_17_fu_646_p3 <= from_cmp_fifo_tkeep_V(47 downto 47);
    tmp_18_fu_662_p3 <= from_cmp_fifo_tkeep_V(46 downto 46);
    tmp_19_fu_678_p3 <= from_cmp_fifo_tkeep_V(45 downto 45);
    tmp_1_fu_398_p3 <= from_cmp_fifo_tkeep_V(63 downto 63);
    tmp_20_fu_694_p3 <= from_cmp_fifo_tkeep_V(44 downto 44);
    tmp_21_fu_710_p3 <= from_cmp_fifo_tkeep_V(43 downto 43);
    tmp_22_fu_726_p3 <= from_cmp_fifo_tkeep_V(42 downto 42);
    tmp_23_fu_742_p3 <= from_cmp_fifo_tkeep_V(41 downto 41);
    tmp_24_fu_758_p3 <= from_cmp_fifo_tkeep_V(40 downto 40);
    tmp_25_fu_774_p3 <= from_cmp_fifo_tkeep_V(39 downto 39);
    tmp_26_fu_790_p3 <= from_cmp_fifo_tkeep_V(38 downto 38);
    tmp_27_fu_806_p3 <= from_cmp_fifo_tkeep_V(37 downto 37);
    tmp_28_fu_822_p3 <= from_cmp_fifo_tkeep_V(36 downto 36);
    tmp_29_fu_838_p3 <= from_cmp_fifo_tkeep_V(35 downto 35);
    tmp_2_fu_406_p3 <= from_cmp_fifo_tkeep_V(62 downto 62);
    tmp_30_fu_854_p3 <= from_cmp_fifo_tkeep_V(34 downto 34);
    tmp_31_fu_870_p3 <= from_cmp_fifo_tkeep_V(33 downto 33);
    tmp_32_fu_886_p3 <= from_cmp_fifo_tkeep_V(32 downto 32);
    tmp_33_fu_902_p3 <= from_cmp_fifo_tkeep_V(31 downto 31);
    tmp_34_fu_918_p3 <= from_cmp_fifo_tkeep_V(30 downto 30);
    tmp_35_fu_934_p3 <= from_cmp_fifo_tkeep_V(29 downto 29);
    tmp_36_fu_950_p3 <= from_cmp_fifo_tkeep_V(28 downto 28);
    tmp_37_fu_966_p3 <= from_cmp_fifo_tkeep_V(27 downto 27);
    tmp_38_fu_982_p3 <= from_cmp_fifo_tkeep_V(26 downto 26);
    tmp_39_fu_998_p3 <= from_cmp_fifo_tkeep_V(25 downto 25);
    tmp_3_fu_422_p3 <= from_cmp_fifo_tkeep_V(61 downto 61);
    tmp_40_fu_1014_p3 <= from_cmp_fifo_tkeep_V(24 downto 24);
    tmp_41_fu_1030_p3 <= from_cmp_fifo_tkeep_V(23 downto 23);
    tmp_42_fu_1046_p3 <= from_cmp_fifo_tkeep_V(22 downto 22);
    tmp_43_fu_1062_p3 <= from_cmp_fifo_tkeep_V(21 downto 21);
    tmp_44_fu_1078_p3 <= from_cmp_fifo_tkeep_V(20 downto 20);
    tmp_45_fu_1094_p3 <= from_cmp_fifo_tkeep_V(19 downto 19);
    tmp_46_fu_1110_p3 <= from_cmp_fifo_tkeep_V(18 downto 18);
    tmp_47_fu_1126_p3 <= from_cmp_fifo_tkeep_V(17 downto 17);
    tmp_48_fu_1142_p3 <= from_cmp_fifo_tkeep_V(16 downto 16);
    tmp_49_fu_1158_p3 <= from_cmp_fifo_tkeep_V(15 downto 15);
    tmp_4_fu_438_p3 <= from_cmp_fifo_tkeep_V(60 downto 60);
    tmp_50_fu_1174_p3 <= from_cmp_fifo_tkeep_V(14 downto 14);
    tmp_51_fu_1190_p3 <= from_cmp_fifo_tkeep_V(13 downto 13);
    tmp_52_fu_1206_p3 <= from_cmp_fifo_tkeep_V(12 downto 12);
    tmp_53_fu_1222_p3 <= from_cmp_fifo_tkeep_V(11 downto 11);
    tmp_54_fu_1238_p3 <= from_cmp_fifo_tkeep_V(10 downto 10);
    tmp_55_fu_1254_p3 <= from_cmp_fifo_tkeep_V(9 downto 9);
    tmp_56_fu_1270_p3 <= from_cmp_fifo_tkeep_V(8 downto 8);
    tmp_57_fu_1286_p3 <= from_cmp_fifo_tkeep_V(7 downto 7);
    tmp_58_fu_1302_p3 <= from_cmp_fifo_tkeep_V(6 downto 6);
    tmp_59_fu_1318_p3 <= from_cmp_fifo_tkeep_V(5 downto 5);
    tmp_5_fu_454_p3 <= from_cmp_fifo_tkeep_V(59 downto 59);
    tmp_60_fu_1334_p3 <= from_cmp_fifo_tkeep_V(4 downto 4);
    tmp_61_fu_1350_p3 <= from_cmp_fifo_tkeep_V(3 downto 3);
    tmp_62_fu_1366_p3 <= from_cmp_fifo_tkeep_V(2 downto 2);
    tmp_63_fu_1382_p3 <= from_cmp_fifo_tkeep_V(1 downto 1);
    tmp_6_fu_470_p3 <= from_cmp_fifo_tkeep_V(58 downto 58);
    tmp_7_fu_486_p3 <= from_cmp_fifo_tkeep_V(57 downto 57);
    tmp_8_fu_502_p3 <= from_cmp_fifo_tkeep_V(56 downto 56);
    tmp_9_fu_518_p3 <= from_cmp_fifo_tkeep_V(55 downto 55);
    tmp_fu_1406_p65 <= (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((tmp_1_fu_398_p3 & select_ln5_fu_414_p3) & select_ln6_fu_430_p3) & select_ln7_fu_446_p3) & select_ln8_fu_462_p3) & select_ln9_fu_478_p3) & select_ln10_fu_494_p3) & select_ln11_fu_510_p3) & select_ln12_fu_526_p3) & select_ln13_fu_542_p3) & select_ln14_fu_558_p3) & select_ln15_fu_574_p3) & select_ln16_fu_590_p3) & select_ln17_fu_606_p3) & select_ln18_fu_622_p3) & select_ln19_fu_638_p3) & select_ln20_fu_654_p3) & select_ln21_fu_670_p3) & select_ln22_fu_686_p3) & select_ln23_fu_702_p3) & select_ln24_fu_718_p3) & select_ln25_fu_734_p3) & select_ln26_fu_750_p3) & select_ln27_fu_766_p3) & select_ln28_fu_782_p3) & select_ln29_fu_798_p3) & select_ln30_fu_814_p3) & select_ln31_fu_830_p3) & select_ln32_fu_846_p3) & select_ln33_fu_862_p3) & select_ln34_fu_878_p3) & select_ln35_fu_894_p3) & select_ln36_fu_910_p3) & select_ln37_fu_926_p3) & select_ln38_fu_942_p3) & select_ln39_fu_958_p3) & select_ln40_fu_974_p3) & select_ln41_fu_990_p3) & select_ln42_fu_1006_p3) & select_ln43_fu_1022_p3) & select_ln44_fu_1038_p3) & select_ln45_fu_1054_p3) & select_ln46_fu_1070_p3) & select_ln47_fu_1086_p3) & select_ln48_fu_1102_p3) & select_ln49_fu_1118_p3) & select_ln50_fu_1134_p3) & select_ln51_fu_1150_p3) & select_ln52_fu_1166_p3) & select_ln53_fu_1182_p3) & select_ln54_fu_1198_p3) & select_ln55_fu_1214_p3) & select_ln56_fu_1230_p3) & select_ln57_fu_1246_p3) & select_ln58_fu_1262_p3) & select_ln59_fu_1278_p3) & select_ln60_fu_1294_p3) & select_ln61_fu_1310_p3) & select_ln62_fu_1326_p3) & select_ln63_fu_1342_p3) & select_ln64_fu_1358_p3) & select_ln65_fu_1374_p3) & select_ln66_fu_1390_p3) & select_ln67_fu_1398_p3);
    trunc_ln791_fu_394_p1 <= from_cmp_fifo_tkeep_V(1 - 1 downto 0);
    xor_ln883_1_fu_1566_p2 <= (from_cmp_fifo_tlast_V xor from_app_tlast_V);
    xor_ln883_fu_1542_p2 <= (from_cmp_fifo_tdata_V xor from_app_tdata_V);
    zext_ln700_fu_345_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(time_cnt_V),64));
end behav;
