if (instance_exists(global.view_target)) {
  var _x_to = global.view_target.x - VIEW_WIDTH/2;
	var _y_to = global.view_target.y - VIEW_HEIGHT/2;
	
	_x_to = clamp(_x_to, 0, room_width - VIEW_WIDTH);
	_y_to = clamp(_y_to, 0, room_height - VIEW_HEIGHT);
	
	var _c_x = camera_get_view_x(view_camera[VIEW])
	var _c_y = camera_get_view_y(view_camera[VIEW])
	
	var _n_x = lerp(_c_x, _x_to, VIEW_SPEED);
	var _n_y = lerp(_c_y, _y_to, VIEW_SPEED);
	
	camera_set_view_pos(view_camera[VIEW], _n_x, _n_y)
}
