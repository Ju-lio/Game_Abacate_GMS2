function player_state_free() {
	var _tecla_esquerda = keyboard_check(vk_left);
	var _tecla_direita = keyboard_check(vk_right);
	var _movimentando = (_tecla_esquerda - _tecla_direita) != 0;

	if (_movimentando) {
		sprite_index = spr_player_walk;
	
		// point_direction apenas coloca num plano cartesiano a direção -1, 0 ou 1
		player_direcao = point_direction(0,0,_tecla_direita - _tecla_esquerda,0);
		player_velocidade = aproximar(player_velocidade, player_velocidade_max, player_aceleracao);
	} else {
		sprite_index = spr_player_idle;
	
		player_velocidade = aproximar(player_velocidade, 0, player_desaceleracao);
	}

	player_velocidade_horizontal = lengthdir_x(player_velocidade, player_direcao);

	if(player_velocidade_horizontal != 0) {
		player_x_scale = sign(player_velocidade_horizontal);
	}

	// VERTICAL
	player_velocidade_vertical += player_gravidade;
	player_velocidade_vertical = clamp(player_velocidade_vertical, player_velocidade_vertical_min, player_velocidade_vertical_max);

	// PULO
	var _tecla_pulo = keyboard_check_pressed(vk_space)
	var _no_chao = place_meeting(x,y + 1, obj_chao);

	if (_no_chao) {
		player_coyote_time = player_coyote_time_max;
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

	if (_tecla_pulo && (player_coyote_time > 0)) {
		player_coyote_time = 0;
		player_velocidade_vertical = 0;
		player_velocidade_vertical -= player_pulo_altura;
	}
}