function player_state_free() {
	var _tecla_esquerda = keyboard_check(vk_left) || gamepad_axis_value(global.gamepad_id, gp_axislh) < -AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padl);
	var _tecla_direita = keyboard_check(vk_right) || gamepad_axis_value(global.gamepad_id, gp_axislh) > AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padr);
	var _movimentando = (_tecla_esquerda - _tecla_direita) != 0;
	var _tecla_dash = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(global.gamepad_id,gp_face4);
	var _tecla_ataque =  keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gamepad_id,gp_face3);

	player_free = true;
	
	if (_tecla_dash && player_dash && player_dash_count > 0) {
		player_velocidade_horizontal = 0;
		player_velocidade_vertical = 0;
		player_dash_count -= 1;
		player_dash_time = 0;
		player_dash = false;
		alarm[0] = player_dash_delay;
		player_free = false;
		state = player_state_dash;
	}

	if (_tecla_ataque) {
		image_index = 0;
		player_free = false;
		state = player_state_attack;
	}
}

function player_state_dash() {
	player_velocidade_vertical = 0;
	player_dash_time = aproximar(player_dash_time, player_dash_distancia, 1);
	player_velocidade_horizontal = lengthdir_x(player_dash_forca, player_direcao)
	if (player_dash_time >= player_dash_distancia) {
		state = player_state_free;
	}
	image_index = 0;
	sprite_index = spr_player_dash;
}

function player_state_attack() {
  sprite_index = spr_player_attack;
	player_atacando = true;
  if image_index >= image_number-1 {
    state = player_state_free;
		player_atacando = false;
  }
}

function player_state_hit() {
	sprite_index = spr_player_hit;
	player_hit = true;
  if image_index >= image_number-1 {
    state = player_state_free;
		player_hit = false;
  }
}