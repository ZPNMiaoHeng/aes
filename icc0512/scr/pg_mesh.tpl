template : pg_mesh_top {
layer : METAL6 {
	direction: horizontal
	width:1
	spacing:30
	number:
	pitch:200
	offset_start : boundary
	offset_type : edge
	offset:
	trim_strap: true

}
layer : METAL5 {
	direction: vertical
	width:1
	spacing:30
	number:
	pitch:200
	offset_start : boundary
	offset_type : edge
	offset:
	trim_strap: true
}
advanced_rule : off {
}
}