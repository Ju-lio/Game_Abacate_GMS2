function player_state_free() {
	var _tecla_esquerda = keyboard_check(vk_left);
	var _tecla_direita = keyboard_check(vk_right);
	var _movimentando = (_tecla_esquerda - _tecla_direita) != 0;
	var _tecla_dash = keyboard_check_pressed(vk_shift)
	

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

	// PULO
	var _tecla_pulo = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up)
	var _no_chao = place_meeting(x,y + 2, obj_chao);
	var _na_parede = place_meeting(x+1,y,obj_chao) || place_meeting(x-1,y,obj_chao);

	if (_no_chao) {
		player_coyote_time = player_coyote_time_max;
		player_pulo_count = player_pulo_max;
		player_dash_count = player_dash_max;
	} else {
		player_coyote_time--;
	
		if(player_velocidade_vertical < 0) {
			// Estou subindo
			sprite_index = spr_player_jump;
		} else if(player_velocidade_vertical > 0) {
		  // Estou caindo
			sprite_index = spr_player_fall;
		}
	}
	
	player_walljump(_tecla_pulo, _no_chao, _na_parede, _movimentando, true);

	if (_tecla_pulo && ((player_coyote_time > 0) || player_pulo_count > 0)) {
		player_pular();
	}
	
	if (_tecla_dash && player_dash && player_dash_count > 0) {
		player_velocidade_horizontal = 0;
		player_velocidade_vertical = 0;
		player_dash_count -= 1;
		player_dash_time = 0;
		player_dash = false;
		alarm[0] = player_dash_delay;
		state = player_state_dash;
	}
}

function player_state_dash() {
	player_dash_time = aproximar(player_dash_time, player_dash_distancia, 1);
	player_velocidade_horizontal = lengthdir_x(player_dash_forca, player_direcao)
	if (player_dash_time >= player_dash_distancia) {
		state = player_state_free;
	}
}