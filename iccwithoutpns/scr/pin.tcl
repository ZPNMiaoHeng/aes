#for {set i 0} {$i<9} {incr i} { \
#    set_pin_physical_constraints -pin_name "din[[expr $i]]"  -side 1 -order [expr $i+1] }
#
#for {set i 10} {$i<16} {incr i} { \
#    for {set j 1} {$j<7} {incr j} { \
#        set_pin_physical_constraints -pin_name "din[[expr $i]]" -side 2 -order [expr $j] } \
#}
#
#set_pin_physical_constraints -pin_name clk -side 2 -order 7
#set_pin_physical_constraints -pin_name rst -side 2 -order 8
#set_pin_physical_constraints -pin_name staenc -side 2 -order 9 
#set_pin_physical_constraints -pin_name stadec -side 3 -order 7
#set_pin_physical_constraints -pin_name load_shift -side 3 -order 8
#set_pin_physical_constraints -pin_name loadkey -side 3 -order 9
#
#for {set i 0} {$i<9} {incr i} { \
#    set_pin_physical_constraints -pin_name "dout[[expr $i]]"  -side 4 -order [expr $i+1] }
#for {set i 10} {$i<16} {incr i} { \
#    for {set j 1} {$j<7} {incr j} { \
#        set_pin_physical_constraints -pin_name "dout[[expr $i]]" -side 3 -order [expr $j] } \
#}
#side 1
set_pin_physical_constraints -pin_name "din[0]" -side 1 -order 1
set_pin_physical_constraints -pin_name "din[1]" -side 1 -order 2
set_pin_physical_constraints -pin_name "din[2]" -side 1 -order 3
set_pin_physical_constraints -pin_name "din[3]" -side 1 -order 4
set_pin_physical_constraints -pin_name "din[4]" -side 1 -order 5
set_pin_physical_constraints -pin_name "din[5]" -side 1 -order 6
set_pin_physical_constraints -pin_name "din[6]" -side 1 -order 7
set_pin_physical_constraints -pin_name "din[7]" -side 1 -order 8
set_pin_physical_constraints -pin_name "dout[7]" -side 1 -order 9
#set_pin_physical_constraints -pin_name "din[8]" -side 1 -order 9

#side2
#

#set_pin_physical_constraints -pin_name "din[9]" -side 2 -order 2
#set_pin_physical_constraints -pin_name "din[10]" -side 2 -order 3
#set_pin_physical_constraints -pin_name "din[11]" -side 2 -order 4
#set_pin_physical_constraints -pin_name "din[12]" -side 2 -order 5
#set_pin_physical_constraints -pin_name "din[13]" -side 2 -order 6
#set_pin_physical_constraints -pin_name "din[14]" -side 2 -order 7
#set_pin_physical_constraints -pin_name "din[15]" -side 2 -order 8
set_pin_physical_constraints -pin_name "clk" -side 2 -order 1
set_pin_physical_constraints -pin_name "rst" -side 2 -order 2
set_pin_physical_constraints -pin_name "staenc" -side 2 -order 3


#side3
set_pin_physical_constraints -pin_name "stadec" -side 3 -order 1
set_pin_physical_constraints -pin_name "load_shift" -side 3 -order 2
set_pin_physical_constraints -pin_name "loadkey" -side 3 -order 3
set_pin_physical_constraints -pin_name "dout[0]" -side 3 -order 4
set_pin_physical_constraints -pin_name "dout[1]" -side 3 -order 5
set_pin_physical_constraints -pin_name "dout[2]" -side 3 -order 6
set_pin_physical_constraints -pin_name "dout[3]" -side 3 -order 7
set_pin_physical_constraints -pin_name "dout[4]" -side 3 -order 8
set_pin_physical_constraints -pin_name "dout[5]" -side 3 -order 9
set_pin_physical_constraints -pin_name "dout[6]" -side 3 -order 10


#side4

#set_pin_physical_constraints -pin_name "dout[8]" -side 4 -order 4
#set_pin_physical_constraints -pin_name "dout[9]" -side 4 -order 5
#set_pin_physical_constraints -pin_name "dout[10]" -side 4 -order 6
#set_pin_physical_constraints -pin_name "dout[11]" -side 4 -order 7
#set_pin_physical_constraints -pin_name "dout[12]" -side 4 -order 8
#set_pin_physical_constraints -pin_name "dout[13]" -side 4 -order 9
#set_pin_physical_constraints -pin_name "dout[14]" -side 4 -order 10
#set_pin_physical_constraints -pin_name "dout[15]" -side 4 -order 11
