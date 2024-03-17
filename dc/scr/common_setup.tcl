#common_setup.tcl
##########################################################################################
# User-defined variables for logical library setup in dc_setup.tcl
##########################################################################################
set DESIGN_NAME aestop


set ADDITIONAL_SEARCH_PATH "				$hu40 \                   
							$hu40_dbpath \					
							../syn \
							../scr \
							../rep \
							../../rtl/aestop_asic_1026 " 

##  Directories containing logical libraries,  
												      ;#  logical design and script files.

set TARGET_LIBRARY_FILES " $hu40_db_ss_0v99_40c \
 $hu40_db_ss_0v99_0c \
 $hu40_db_ss_0v99_125c \
 $hu40_db_ss_0v9_0c \
 $hu40_db_ss_0v9_125c \
 $hu40_db_ss_0v9_n40c  "
# $hu40_db_tt_1v0_25c \
# $hu40_db_tt_1v1_25c \
# $hu40_db_tt_1v2_25c \ 
# $hu40_db_ff_1v1_0c \
# $hu40_db_ff_1v1_40c \
# $hu40_db_ff_1v1_125c \
# $hu40_db_ff_1v21_0c \
# $hu40_db_ff_1v21_40c \
# $hu40_db_ff_1v21_125c \
# $hu40_db_ff_1v26_0c \
# $hu40_db_ff_1v26_40c \
# $hu40_db_ff_1v26_125c "         ;#  Logical technology library file

set SYMBOL_LIBRARY_FILES "$hu40_sdb    "             ;#  Symbol library file
##########################################################################################
# User-defined variables for physical library setup in dc_setup.tcl
##########################################################################################

set MW_DESIGN_LIB    aes_mw                       ;#   User-defined Milkyway design library name

set power_net   "VDD"
set ground_net 	"VSS"
set mw_logic1_net $power_net
set mw_logic0_net $ground_net

set MW_REFERENCE_LIB_DIRS  "$hu40_mw/hu40npksdst_m07f1f0f0_RDL"            ;#   Milkyway reference libraries

set TECH_FILE $hu40_tf7m               ;#   Milkyway technology file

set TLUPLUS_MAX_FILE $hu40_TLU_CMAX     ;#   Max TLUPlus file
set TLUPLUS_MIN_FILE $hu40_TLU_CMIN    ;#   Min TLUPlus file
set TLUPLUS_TYP_FILE $hu40_TLU_TYP     ;#   Typ TLUPlus file

set MAP_FILE $hu40_map                     ;#   Mapping file for TLUplus
