set ALL_PORTS [get_ports -all]
foreach_in_collection PORT_NAME $ALL_PORTS {
	set xy_location [get_location $PORT_NAME]
	set x_location [lindex $xy_location 0]
	set y_location [lindex $xy_location 1]
	set TEXT_NAME [collection_to_list $PORT_NAME]
	set TEXT_NAME_1 [string range $TEXT_NAME 7 end-2]
	create_text -origin [list [expr $x_location] [expr $y_location]] \
		-heigh 1 \
		-layer TEXT1 \
		-orient W $TEXT_NAME_1
}