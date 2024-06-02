function enemy_state_free() {
  if !instance_exists(obj_player) {
    exit;
  }

  // Calcula a direção para o jogador
  var _direction_to_player = point_direction(x, y, obj_player.x, obj_player.y);

  // Calcula a distância para o jogador
  var _distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

  // Detectar os limites da plataforma
  var _platform_instance = instance_nearest(x, y, obj_platform);
  if (_platform_instance != noone) {
      left_limit = _platform_instance.bbox_left + 16;
      right_limit = _platform_instance.bbox_right - 16;
  }

  sprite_index = spr_inimigo_idle;

  // Movimento horizontal dentro dos limites da plataforma
  if (_distance_to_player < fov_radius) {
    // Movimentação em direção ao jogador somente na horizontal
    if (obj_player.x > x && x < right_limit) /*&& (!atacando)*/ {
      x += 2; // Velocidade de movimento para a direita
      player_x_scale = 1;
      sprite_index = spr_inimigo_walk;
    } else if (obj_player.x < x && x > left_limit) /*&& (!atacando)*/ {
      x -= 2; // Velocidade de movimento para a esquerda
      player_x_scale = -1;
      sprite_index = spr_inimigo_walk;
    }
  }

  // ## ATAQUE ##

  // Se estou atacando e meu tempo de delay está zero, o jogador pode receber o dano
  if (can_attack > 0) && (attack_delay == 1) {
    attack_damage = true;
  } else {
    attack_damage = false;
  }

  // Cronometro poder atacar novamente
  if can_attack > 0 {
    can_attack -= 1;
  }

  // Cronometro delay de dano
  if attack_delay > 0 {
    sprite_index = spr_inimigo_attack;
    attack_delay -= 1;
  }

  // Atacando
  // Se está no campo de visão
  if (_distance_to_player < fov_radius_attack) {
    // E meu crometro de ataque zerou => realizo o ataque
    if (can_attack == 0) {
      // Inicio o meu ataque
      can_attack = attack_time;
      attack_delay = 14;
    }
  }
}

function enemy_state_hit() {
	sprite_index = spr_inimigo_hit;
	in_hit = true;
  if image_index >= image_number-1 {
    state = enemy_state_free;
		in_hit = false;
  }
}
