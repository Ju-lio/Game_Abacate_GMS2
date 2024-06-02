if keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(global.gamepad_id,gp_start) {
	if !instance_exists(obj_player) {
		room_restart()
	}
}

// DEGUB

if global.game_debug {
  if keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(global.gamepad_id,gp_start) {
		room_restart();
	}
}

if keyboard_check_pressed(ord("P")) {
	global.game_debug = !global.game_debug;
}

