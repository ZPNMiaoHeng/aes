#dc_run.tcl
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# dc_shell -topo command
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

remove_design -design
#formal verification
set_svf ${DESIGN_NAME}.svf
#set library info
#source ../scr/MPW180_lib_list.tcl

#set dc library
#source ../scr/.synopsys_dc.setup

###check setup information
printvar target_library
printvar link_library
#alias
#check_library
check_tlu_plus_files

#analyze -format verilog -lib work  {aestop.v byte02.v byte9bde.v byte0203.v control.v cryptdap.v decryptfsm.v encryptfsm.v \
invsbox_mux.v keyexp.v keyexpfsm.v mux21_8.v mux21_16.v mux21_128.v mux41_8.v mux41_128.v reg_16.v \
reg_128.v sbox_mux.v shfreg_128.v }
analyze -format verilog -lib work  {aestop.v byte02.v byte9bde.v byte0203.v control.v cryptdap.v decryptfsm.v encryptfsm.v \
invsbox_mux.v keyexp.v mux21_8.v mux21_128.v mux41_8.v mux41_128.v reg_8_0.v \
reg_128_rst.v sbox_mux.v shfreg_128.v reg_8_1.v reg_8_2.v reg_8_3.v reg_8_4.v reg_8_5.v reg_8_6.v \
reg_8_7.v reg_8_8.v reg_8_9.v reg_8_10.v reg_8_11.v reg_8_12.v reg_8_13.v reg_8_14.v reg_8_15.v}


elaborate $DESIGN_NAME
link
check_design
 
write -hierarchy -f ddc -out ../out/${DESIGN_NAME}_unmap.ddc
source sdc.tcl
#source sdc1020.tcl
#source combsdc.tcl
check_timing
set_preferred_routing_direction -layers {M3 M5} -direction horizontal
set_preferred_routing_direction -layers {M2 M4 M6} -direction vertical 

#compile_ultra -no_autoungroup
#compile_ultra -spg
compile_ultra

report_constraint -significant_digits 4 -all > ../rep/rep_consitraints
report_timing > ../rep/${DESIGN_NAME}_timing
report_area > ../rep/${DESIGN_NAME}_area
report_power > ../rep/${DESIGN_NAME}_power

write -hierarchy -format ddc -output ../out/$DESIGN_NAME.mapped.ddc
write -hierarchy -format verilog -output ../out/$DESIGN_NAME.mapped.v
write_sdc ../out/$DESIGN_NAME.mapped.sdc
write_sdf ../out/$DESIGN_NAME.mapped.sdf
##formal
set_svf off
