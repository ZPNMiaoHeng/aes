###################################################################

# Created by write_sdc on Sun Jun  4 08:30:45 2023

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max SS0P99V125C -max_library hu40npksdst_ss0p99v125c\
                         -min SS0P99VN40C -min_library hu40npksdst_ss0p99vn40c
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[5]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[4]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[3]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[2]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[1]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[0]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[7]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports {din[6]}]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports loadkey]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports load_shift]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports stadec]
set_driving_cell -lib_cell SEN_INV_S_1 -library hu40npksdst_ss0p99vn40c -pin X \
[get_ports staenc]
set_load -pin_load 1 [get_ports {dout[5]}]
set_load -pin_load 1 [get_ports {dout[4]}]
set_load -pin_load 1 [get_ports {dout[3]}]
set_load -pin_load 1 [get_ports {dout[2]}]
set_load -pin_load 1 [get_ports {dout[1]}]
set_load -pin_load 1 [get_ports {dout[0]}]
set_load -pin_load 1 [get_ports {dout[7]}]
set_load -pin_load 1 [get_ports {dout[6]}]
set_max_fanout 10 [get_ports loadkey]
set_propagated_clock [get_ports clk]
create_clock [get_ports clk]  -period 2.5  -waveform {0 1.25}
set_clock_latency -rise 0.229504  [get_clocks clk]
set_clock_latency -fall 0.224913  [get_clocks clk]
group_path -name INOUT  -from [list [get_ports clk] [get_ports rst] [get_ports staenc] [get_ports     \
stadec] [get_ports load_shift] [get_ports loadkey] [get_ports {din[7]}]        \
[get_ports {din[6]}] [get_ports {din[5]}] [get_ports {din[4]}] [get_ports      \
{din[3]}] [get_ports {din[2]}] [get_ports {din[1]}] [get_ports {din[0]}]]  -to [list [get_ports {dout[7]}] [get_ports {dout[6]}] [get_ports {dout[5]}]   \
[get_ports {dout[4]}] [get_ports {dout[3]}] [get_ports {dout[2]}] [get_ports   \
{dout[1]}] [get_ports {dout[0]}]]
group_path -name INPUT  -from [list [get_ports clk] [get_ports rst] [get_ports staenc] [get_ports     \
stadec] [get_ports load_shift] [get_ports loadkey] [get_ports {din[7]}]        \
[get_ports {din[6]}] [get_ports {din[5]}] [get_ports {din[4]}] [get_ports      \
{din[3]}] [get_ports {din[2]}] [get_ports {din[1]}] [get_ports {din[0]}]]
group_path -name OUTPUT  -to [list [get_ports {dout[7]}] [get_ports {dout[6]}] [get_ports {dout[5]}]   \
[get_ports {dout[4]}] [get_ports {dout[3]}] [get_ports {dout[2]}] [get_ports   \
{dout[1]}] [get_ports {dout[0]}]]
set_input_delay -clock clk  -max 0.5  [get_ports staenc]
set_input_delay -clock clk  -max 0.5  [get_ports stadec]
set_input_delay -clock clk  -max 0.5  [get_ports load_shift]
set_input_delay -clock clk  -max 0.5  [get_ports loadkey]
set_input_delay -clock clk  -max 0.5  [get_ports {din[7]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[6]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[5]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[4]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[3]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[2]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[1]}]
set_input_delay -clock clk  -max 0.5  [get_ports {din[0]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[7]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[6]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[5]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[4]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[3]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[2]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[1]}]
set_output_delay -clock clk  -max 0.5  [get_ports {dout[0]}]
set_input_transition -max 0.1  [get_ports rst]
set_input_transition -max 0.1  [get_ports clk]
