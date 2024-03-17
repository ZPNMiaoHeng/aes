# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Constraints
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set clock constrians
create_clock -period 2.5 [get_ports clk]
set_dont_touch_network [get_ports clk]
set CLOCK1 [get_clocks clk]
#set_clock_latency -source -max 0.5 $CLOCK1
set_clock_latency -max 0.25 $CLOCK1
set_clock_uncertainty -setup 0.13 $CLOCK1 ;#clock period 5%;skew=0.04,jitter=0.03,margin=0.03
set_clock_transition -max 0.05 $CLOCK1

## path group
group_path -name INPUT -from [all_inputs]
group_path -name OUTPUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#
set_dont_touch_network [get_port rst]
#set_dont_touch [get_cells "PIW_* PO8W_*"] true
set_dont_touch_network [get_port din*]
set_dont_touch_network [get_port dout*]
set_dont_touch_network [get_port staenc]
set_dont_touch_network [get_port stadec]
set_dont_touch_network [get_port load_shift]
#set_dont_touch_network [get_port loadkey]
set_max_fanout 10 [get_port loadkey]

#set input_dealy except clock
set all_in_exp_clkrst [remove_from_collection [all_inputs] [get_ports "clk rst"]] 
set_input_delay -max 0.5 -clock $CLOCK1 $all_in_exp_clkrst
#set_input_delay -max 10 -clock $CLOCK1 [get_ports wr_addr]
#set_input_delay -max 10 -clock $CLOCK1 [get_ports din]

#set output_delay
set_output_delay -max 0.5 -clock $CLOCK1 [all_outputs]


#set mux_area 0
#set_false_path -from decrydap/resultreg/dout_reg -to decrydap/resultreg/dout_reg

set_input_transition -max 0.1 [remove_from_collection [all_inputs] [all_clocks]]

#SEN_INV_S_1
set_driving_cell -lib_cell SEN_INV_S_1  -pin X -library hu40npksdst_ss0p99vn40c \
     $all_in_exp_clkrst
#set_driving_cell -lib_cell INHDV16 -pin ZN -library scc018ug_hd_rvt_ss_v1p62_125c_basic [get_ports rst]

set_load 1 [all_outputs]
#set_dont_touch_network [get_port RESET]
set_operating_conditions  -max "SS0P99V125C" -min "SS0P99VN40C"


#set_wire_load_mode "10x10"
#set_wire_load_mode top
#
#set_app_var auto_wire_load_selection trueyanzheng 
#create_clock -period $SOUT_period [get_ports SOUT]
#set_dont_touch_network [get_port SOUT]
#set CLOCK2 [get_clocks SOUT]
#set_clock_latency -source -max 0.2 $CLOCK2
#set_clock_latency -max 0.1 $CLOCK2
#set_clock_uncertainty -setup 0.1 $CLOCK2 ;#clock period 5%;skew=0.04,jitter=0.03,margin=0.03
#set_clock_transition -max 0.01 $CLOCK2
#set_input_delay -max 0.3 -clock $CLOCK2 [get_ports OD*]
#set_input_delay -max 0.3 -clock $CLOCK2 [get_ports M*]


#set_max_delay 1.0 -from [get_ports TST\[*\]] -to [get_ports TST_OUT]
#set_min_delay 3 -from [get_ports PD] -to [get_ports PDB*]
#set_min_delay 3 -from [get_ports OE] -to [get_ports FOUT]
#set_min_delay 3 -from [get_ports BP] -to [get_ports FOUT]
