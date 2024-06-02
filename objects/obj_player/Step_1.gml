//START STEP

var _tecla_esquerda = keyboard_check(vk_left) || gamepad_axis_value(global.gamepad_id, gp_axislh) < -AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padl);
var _tecla_direita = keyboard_check(vk_right) || gamepad_axis_value(global.gamepad_id, gp_axislh) > AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padr);
var _movimentando = (_tecla_esquerda - _tecla_direita) != 0;
var _tecla_dash = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(global.gamepad_id,gp_face4);
var _tecla_ataque =  keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gamepad_id,gp_face3)
	
// MOVIMENTAÇÃO ANDANDO
if (_movimentando) {
	if player_free {
	  sprite_index = spr_player_walk;
	}
	
	// point_direction apenas coloca num plano cartesiano a direção -1, 0 ou 1
	player_direcao = point_direction(0,0,_tecla_direita - _tecla_esquerda,0);
	player_velocidade = aproximar(player_velocidade, player_velocidade_max, player_aceleracao);
} else {
	// PARADO
	if player_free {
	  sprite_index = spr_player_idle;
	}
	player_velocidade = aproximar(player_velocidade, 0, player_desaceleracao);
}

// PULO
var _tecla_pulo = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.gamepad_id,gp_face1);
var _no_chao = place_meeting(x,y + 2, obj_chao) || place_meeting(x,y + 2, obj_platform);
var _na_parede = place_meeting(x+1,y,obj_chao) || place_meeting(x-1,y,obj_chao);

if (_no_chao) {
	player_coyote_time = player_coyote_time_max;
	player_pulo_count = player_pulo_max;
	player_dash_count = player_dash_max;
} else {
	player_coyote_time--;

  if (player_free) {
		if(player_velocidade_vertical < 0) {
			// Estou subindo
			sprite_index = spr_player_jump;
		} else if(player_velocidade_vertical > 0) {
			// Estou caindo
			sprite_index = spr_player_fall;
		}
	}
}

player_walljump(_tecla_pulo, _no_chao, _na_parede, _movimentando, true);

if (_tecla_pulo && ((player_coyote_time > 0) || player_pulo_count > 0)) {
	player_pular();
}