// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _traffic_gen_tx_HH_
#define _traffic_gen_tx_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct traffic_gen_tx : public sc_module {
    // Port declarations 20
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_lv<512> > from_decoder_tdata_V;
    sc_in< sc_lv<64> > from_decoder_tkeep_V;
    sc_in< sc_lv<1> > from_decoder_tlast_V;
    sc_in< sc_lv<1> > from_decoder_tvalid_V;
    sc_out< sc_lv<512> > to_app_tdata_V;
    sc_out< sc_lv<64> > to_app_tkeep_V;
    sc_out< sc_lv<1> > to_app_tlast_V;
    sc_out< sc_lv<1> > to_app_tvalid_V;
    sc_out< sc_lv<512> > to_cmp_fifo_tdata_V;
    sc_out< sc_lv<64> > to_cmp_fifo_tkeep_V;
    sc_out< sc_lv<1> > to_cmp_fifo_tlast_V;
    sc_out< sc_lv<1> > to_cmp_fifo_tvalid_V;
    sc_out< sc_lv<1> > from_decoder_tready_V;
    sc_in< sc_lv<1> > to_app_tready_V;
    sc_out< sc_lv<32> > tx_timeElapse_V;
    sc_out< sc_lv<64> > tx_timestamp_sum_V;
    sc_out< sc_lv<32> > pkt_cnt_tx_V;
    sc_out< sc_lv<32> > time_cnt_V;


    // Module declarations
    traffic_gen_tx(sc_module_name name);
    SC_HAS_PROCESS(traffic_gen_tx);

    ~traffic_gen_tx();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_lv<32> > tx_timeElapse_reg_V;
    sc_signal< sc_lv<64> > tx_timestamp_sum_reg;
    sc_signal< sc_lv<32> > pkt_cnt_tx_reg_V;
    sc_signal< sc_lv<1> > start_flag_V;
    sc_signal< sc_lv<32> > time_cnt_reg_V;
    sc_signal< sc_lv<32> > tx_start_V;
    sc_signal< sc_lv<1> > start_initialized_V;
    sc_signal< sc_lv<1> > core_on_V;
    sc_signal< sc_lv<32> > sub_ln214_fu_276_p2;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<1> > and_ln36_3_fu_266_p2;
    sc_signal< sc_lv<64> > add_ln700_fu_292_p2;
    sc_signal< sc_lv<32> > add_ln700_1_fu_304_p2;
    sc_signal< sc_lv<1> > tmp_fu_420_p3;
    sc_signal< sc_lv<32> > add_ln700_2_fu_444_p2;
    sc_signal< sc_lv<1> > core_on_V_load_load_fu_434_p1;
    sc_signal< sc_lv<1> > start_initialized_V_s_load_fu_316_p1;
    sc_signal< sc_lv<1> > and_ln43_1_fu_332_p2;
    sc_signal< sc_lv<1> > from_decoder_tvalid_s_read_fu_123_p2;
    sc_signal< sc_lv<1> > ret_V_fu_236_p2;
    sc_signal< sc_lv<1> > and_ln883_fu_350_p2;
    sc_signal< sc_lv<1> > and_ln51_1_fu_388_p2;
    sc_signal< sc_lv<1> > and_ln36_1_fu_248_p2;
    sc_signal< sc_lv<1> > and_ln36_2_fu_254_p2;
    sc_signal< sc_lv<1> > icmp_ln883_fu_260_p2;
    sc_signal< sc_lv<64> > zext_ln700_fu_288_p1;
    sc_signal< sc_lv<1> > and_ln43_fu_326_p2;
    sc_signal< sc_lv<1> > and_ln544_fu_344_p2;
    sc_signal< sc_lv<1> > and_ln51_fu_382_p2;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_lv<1> ap_ST_fsm_state1;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<64> ap_const_lv64_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<512> ap_const_lv512_lc_1;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_logic ap_const_logic_0;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_add_ln700_1_fu_304_p2();
    void thread_add_ln700_2_fu_444_p2();
    void thread_add_ln700_fu_292_p2();
    void thread_and_ln36_1_fu_248_p2();
    void thread_and_ln36_2_fu_254_p2();
    void thread_and_ln36_3_fu_266_p2();
    void thread_and_ln43_1_fu_332_p2();
    void thread_and_ln43_fu_326_p2();
    void thread_and_ln51_1_fu_388_p2();
    void thread_and_ln51_fu_382_p2();
    void thread_and_ln544_fu_344_p2();
    void thread_and_ln883_fu_350_p2();
    void thread_ap_CS_fsm_state1();
    void thread_core_on_V_load_load_fu_434_p1();
    void thread_from_decoder_tready_V();
    void thread_from_decoder_tvalid_s_read_fu_123_p2();
    void thread_icmp_ln883_fu_260_p2();
    void thread_pkt_cnt_tx_V();
    void thread_ret_V_fu_236_p2();
    void thread_start_initialized_V_s_load_fu_316_p1();
    void thread_sub_ln214_fu_276_p2();
    void thread_time_cnt_V();
    void thread_tmp_fu_420_p3();
    void thread_to_app_tdata_V();
    void thread_to_app_tkeep_V();
    void thread_to_app_tlast_V();
    void thread_to_app_tvalid_V();
    void thread_to_cmp_fifo_tdata_V();
    void thread_to_cmp_fifo_tkeep_V();
    void thread_to_cmp_fifo_tlast_V();
    void thread_to_cmp_fifo_tvalid_V();
    void thread_tx_timeElapse_V();
    void thread_tx_timestamp_sum_V();
    void thread_zext_ln700_fu_288_p1();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
