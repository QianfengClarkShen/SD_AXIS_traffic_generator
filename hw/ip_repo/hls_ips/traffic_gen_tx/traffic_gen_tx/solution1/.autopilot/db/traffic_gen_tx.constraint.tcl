set clock_constraint { \
    name clk \
    module traffic_gen_tx \
    port ap_clk \
    period 4 \
    uncertainty 0.5 \
}

set all_path {}

set false_path {}

