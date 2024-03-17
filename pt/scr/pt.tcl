# after syn timing analyze
source -echo ../../dc/scr/hu40_lib.tcl
source ../../dc/scr/common_setup.tcl
set search_path "$ADDITIONAL_SEARCH_PATH"
set target_library "$TARGET_LIBRARY_FILES"
set link_library "$TARGET_LIBRARY_FILES"
set symbol_library "$SYMBOL_LIBRARY_FILES"

read_verilog ../../dc/out/aestop.mapped.v
current_design ${DESIGN_NAME}
link

source ../../dc/scr/sdc.tcl

report_timing > ../out/timing_summary
report_timing -inp -net -trans -cap -path_type full_clock_expanded  -derate \
              -crosstalk_delta -delay max -max_paths 5 -significant_digits 3 > ../out/timing_report

# after pnr timing analyze , with spef file
