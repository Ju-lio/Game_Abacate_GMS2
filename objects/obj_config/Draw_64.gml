
if !instance_exists(obj_player) {
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	var _tecla;
	if global.gamepad_id == -1 {
	  _tecla = "R";
	} else {
	  _tecla = "Start";
	}
	
	draw_text( display_get_gui_width()/2, display_get_gui_height()/2,"Pressione "+_tecla+" para recomecar");
}

