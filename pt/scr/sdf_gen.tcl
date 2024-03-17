source -echo ../../dc/scr/hu40_lib.tcl
# source -echo ../../dc/scr/MPW180_lib_list.tcl
source ../../dc/scr/common_setup.tcl
set search_path "$ADDITIONAL_SEARCH_PATH"
set link_library "$TARGET_LIBRARY_FILES" 
read_db ../../MPW180TECHFILE/STC/liberty/scc018ug_hd_rvt_ss_v1p62_125c_basic.db
read_db ../../MPW180TECHFILE/IO/syn/SP018W_V1p8_typ.db

set rtl_path ../../icc_1101/out
read_verilog $rtl_path/aestop_io_pred.v

link

current_design aestop_io
read_parasitics -pin_cap_include $rtl_path/aestop_io.spef
read_sdc ../../icc_1101/out/aestop_io_pred.sdc

write_sdf ../out/aestop_io.sdf

