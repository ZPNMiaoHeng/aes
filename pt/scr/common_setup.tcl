## Library-specific data.

set libname		hu40npksdst
set max_corner		ss0p99vn40c
set min_corner		ss0p99v125c
set mstack		m07f0f1f0_RDL	

set DESIGN_NAME		aestop
set sdcfile     	"../../icc/out/${DESIGN_NAME}.out.sdc"
set netfile		"../../icc/out/${DESIGN_NAME}.pg.v"
set speffile            "../../signoff/StarRC/results/${design_name}.spef"

set search_path 	"../../../liberty/logic_synth $synopsys_root/libraries/syn"
set link_library 	"* ${libname}_${max_corner}.db"
set target_library	"${libname}_${max_corner}.db"
set_min_library		"${libname}_${max_corner}.db" -min_version "${libname}_${min_corner}.db"


