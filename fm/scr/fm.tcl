source -echo ../../dc/scr/hu40_lib.tcl
source ../../dc/scr/common_setup.tcl
set search_path "$ADDITIONAL_SEARCH_PATH"
set target_library "$TARGET_LIBRARY_FILES"
set link_library "$TARGET_LIBRARY_FILES"
set symbol_library "$SYMBOL_LIBRARY_FILES"

set rtl_path "../../rtl/aestop_asic_1026"

#set source file
set RTL_SOURCE_FILES "aestop.v byte02.v byte9bde.v byte0203.v control.v cryptdap.v decryptfsm.v encryptfsm.v \
invsbox_mux.v keyexp.v mux21_8.v mux21_128.v mux41_8.v mux41_128.v reg_8_0.v \
reg_128_rst.v sbox_mux.v shfreg_128.v reg_8_1.v reg_8_2.v reg_8_3.v reg_8_4.v reg_8_5.v reg_8_6.v \
reg_8_7.v reg_8_8.v reg_8_9.v reg_8_10.v reg_8_11.v reg_8_12.v reg_8_13.v reg_8_14.v reg_8_15.v "
#set dc gatenetlist file
set DC_GATENETLIST ../../dc/out/aestop.mapped.v
#################################################################################
# Synopsys Auto Setup Mode
#################################################################################

set_app_var synopsys_auto_setup true

#################################################################################
# Read in the SVF file(s)
#################################################################################

# Set this variable to point to individual SVF file(s) or to a directory containing SVF files.

set_svf ../../dc/syn/aestop.svf

#################################################################################
# Read in the libraries
#################################################################################

#foreach tech_lib "${TARGET_LIBRARY_FILES} ${ADDITIONAL_LINK_LIB_FILES}" {
#  read_db -technology_library $tech_lib
#}
read_db -technology_library $TARGET_LIBRARY_FILES

#################################################################################
# Read in the Reference Design as verilog/vhdl source code
#################################################################################

read_verilog -r ${RTL_SOURCE_FILES} -work_library WORK

set_top r:/WORK/${DESIGN_NAME}

#################################################################################
# Read in the Implementation Design from DC-RM results
#
# Choose the format that is used in your flow.
#################################################################################

# For Verilog
read_verilog -i $DC_GATENETLIST

set_top i:/WORK/${DESIGN_NAME}
# OR

# For DDC
#read_ddc -i ${RESULTS_DIR}/${DCRM_FINAL_DDC_OUTPUT_FILE}

# OR

# For Milkyway

# The -no_pg option should be used for MW designs from DC to prevent automatic
# linking to power aware versions of the cells.

# read_milkyway -i -no_pg -libname WORK -cell_name ${DCRM_FINAL_MW_CEL_NAME} ${mw_design_library}



#################################################################################
# Report design statistics, design read warning messages, and user specified setup
#################################################################################

# report_setup_status will create a report showing all design statistics,
# design read warning messages, and all user specified setup.  This will allow
# the user to check all setup before proceeding to run the more time consuming
# commands "match" and "verify".

# report_setup_status

#################################################################################
# Match compare points and report unmatched points 
#################################################################################

match

#report_unmatched_points > ${REPORTS_DIR}/${FMRM_UNMATCHED_POINTS_REPORT}


#################################################################################
# Verify and Report
#
# If the verification is not successful, the session will be saved and reports
# will be generated to help debug the failed or inconclusive verification.
#################################################################################

verify
#if { ![verify] }  {  
#  save_session -replace ${REPORTS_DIR}/${FMRM_FAILING_SESSION_NAME}
#  report_failing_points > ${REPORTS_DIR}/${FMRM_FAILING_POINTS_REPORT}
#  report_aborted > ${REPORTS_DIR}/${FMRM_ABORTED_POINTS_REPORT}
#  # Use analyze_points to help determine the next step in resolving verification
#  # issues. It runs heuristic analysis to determine if there are potential causes
#  # other than logical differences for failing or hard verification points. 
#  analyze_points -all > ${REPORTS_DIR}/${FMRM_ANALYZE_POINTS_REPORT}
#}
#
#exit
