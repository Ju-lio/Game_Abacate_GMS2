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
		image_index = 0;
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
	sprite_index = spr_player_dash;
}

function player_state_attack() {
  sprite_index = spr_player_attack;
	player_atacando = true;
	
	// Supondo que você tem uma variável para armazenar a referência ao inimigo mais próximo
	var _nearest_enemy = noone;
	var _nearest_distance = -1;

	// Loop através de todos os inimigos
	with(obj_enemy) {
	    // Calcular a distância entre o jogador e o inimigo atual
	    var _distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);
    
	    // Verificar se este é o inimigo mais próximo até agora
	    if (_nearest_distance == -1 || _distance_to_player < _nearest_distance) {
	        _nearest_enemy = id; // Armazenar a instância do inimigo
	        _nearest_distance = _distance_to_player; // Atualizar a distância mais próxima
	    }
	}

	// Atacar o inimigo mais próximo, se houver algum
	if (_nearest_enemy != noone) {
    if (!_nearest_enemy.in_hit) && place_meeting(x,y,_nearest_enemy) {
			_nearest_enemy.life -= 1;
			_nearest_enemy.image_index = 0;
  		_nearest_enemy.state = enemy_state_hit;
		}
	}

	
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

function player_state_walljump() {
	// PULO
	var _tecla_pulo = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.gamepad_id,gp_face1);
	var _no_chao = place_meeting(x,y + 2, obj_chao);
  var _na_parede = place_meeting(x+1,y,obj_chao) || place_meeting(x-1,y,obj_chao);
	
	var _tecla_esquerda = keyboard_check(vk_left) || gamepad_axis_value(global.gamepad_id, gp_axislh) < -AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padl);
	var _tecla_direita = keyboard_check(vk_right) || gamepad_axis_value(global.gamepad_id, gp_axislh) > AXIS_DEADZONE || gamepad_button_check(global.gamepad_id,gp_padr);
	var _movimentando = (_tecla_esquerda - _tecla_direita) != 0;
	var _tecla_dash = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(global.gamepad_id,gp_face4);
	var _tecla_ataque =  keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gamepad_id,gp_face3)

	// if (_na_parede) && (!_no_chao) {
		// player_velocidade_horizontal = 0;
	player_coyote_time = player_coyote_time_max;
	player_pulo_count = player_pulo_max;
	player_dash_count = player_dash_max;
		if (player_velocidade_vertical > 1) {
			sprite_index = spr_player_wall;
			player_velocidade_vertical = 1;	
		}
		
		if (_tecla_pulo) {
			player_pular()
			player_pode_mover = 5;
			player_velocidade_horizontal -= 2 * player_x_scale;
			state = player_state_free;
			exit;
		}   

		if (!_na_parede){
			state = player_state_free;
			exit;
		} 
	// }
}