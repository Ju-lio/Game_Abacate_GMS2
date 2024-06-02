//START STEP

var _tecla_esquerda = keyboard_check(vk_left) || gamepad_axis_value(global.gamepad_id, gp_axislh) < -AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padl);
var _tecla_direita = keyboard_check(vk_right) || gamepad_axis_value(global.gamepad_id, gp_axislh) > AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padr);
var _movimentando = (_tecla_esquerda - _tecla_direita) != 0;
var _tecla_dash = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(global.gamepad_id,gp_face4);
var _tecla_ataque =  keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gamepad_id,gp_face3)
	

// MOVIMENTAÇÃO ANDANDO
if (_movimentando) {
	sprite_index = spr_player_walk;
	
	// point_direction apenas coloca num plano cartesiano a direção -1, 0 ou 1
	player_direcao = point_direction(0,0,_tecla_direita - _tecla_esquerda,0);
	player_velocidade = aproximar(player_velocidade, player_velocidade_max, player_aceleracao);
} else {
	// PARADO
	sprite_index = spr_player_idle;
	player_velocidade = aproximar(player_velocidade, 0, player_desaceleracao);
}

// DIRECIONAMENTO DO PLAYER
player_pode_mover = aproximar(player_pode_mover, 0, 0.4);
if (player_pode_mover <= 0) {
	player_velocidade_horizontal = lengthdir_x(player_velocidade, player_direcao);
}

// INVERTER SPRITE DO PLAYER
if(player_velocidade_horizontal != 0) {
	player_x_scale = sign(player_velocidade_horizontal);
}

// MOVIMENTAÇÃO VERTICAL
player_velocidade_vertical += player_gravidade;
player_velocidade_vertical = clamp(player_velocidade_vertical, player_velocidade_vertical_min, player_velocidade_vertical_max);