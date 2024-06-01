if keyboard_check_pressed(ord("R")) {
	if !instance_exists(obj_player) {
		room_restart()
	}
}

// DEGUB

if global.game_debug {
  if keyboard_check_pressed(ord("R")) {
		room_restart();
	}
}

if keyboard_check_pressed(ord("P")) {
	global.game_debug = !global.game_debug;
}

