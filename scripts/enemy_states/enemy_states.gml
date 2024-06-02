function enemy_state_free() {
  if !instance_exists(obj_player) {
    exit;
  }

  var _player = obj_player;

  // Calcula a direção para o jogador
  var _direction_to_player = point_direction(x, y, _player.x, _player.y);

  // Calcula a distância para o jogador
  var _distance_to_player = point_distance(x, y, _player.x, _player.y);

  /*
  // Verifica se o jogador está dentro do raio de visão
  if (_distance_to_player < fov_radius) {
      // Calcula o ângulo de visão atual do inimigo
      var _current_angle = direction;

      // Calcula o ângulo mínimo e máximo do campo de visão
      var _min_angle = _current_angle - fov_angle / 2;
      var _max_angle = _current_angle + fov_angle / 2;

      // Verifica se o jogador está dentro do ângulo de visão
      if (_direction_to_player >= _min_angle && _direction_to_player <= _max_angle) {
          // Jogador está no campo de visão, atacar!
          attack_player(_player);
      }
  }*/

  // Detectar os limites da plataforma
  var _platform_instance = instance_nearest(x, y, obj_plataforma_one_way_vertical);

  if (_platform_instance != noone) {
      left_limit = _platform_instance.bbox_left + 16;
      right_limit = _platform_instance.bbox_right - 16;
  }

  sprite_index = spr_inimigo_idle;

  // Movimento horizontal dentro dos limites da plataforma
  if (_distance_to_player < fov_radius) {
    // Movimentação em direção ao jogador somente na horizontal
    if (_player.x > x && x < right_limit) /*&& (!atacando)*/ {
      x += 2; // Velocidade de movimento para a direita
      image_xscale = 1;
      sprite_index = spr_inimigo_walk;
    } else if (_player.x < x && x > left_limit) /*&& (!atacando)*/ {
      x -= 2; // Velocidade de movimento para a esquerda
      image_xscale = -1;
      sprite_index = spr_inimigo_walk;
    }
  }

  // ## ATAQUE ##

  // Se estou atacando e meu tempo de delay está zero, o jogador pode receber o dano
  if (ataque_pode_atacar > 0) && (ataque_delay == 1) {
    ataque_dano = true;
  } else {
    ataque_dano = false;
  }

  // Cronometro poder atacar novamente
  if ataque_pode_atacar > 0 {
    ataque_pode_atacar -= 1;
  }

  // Cronometro delay de dano
  if ataque_delay > 0 {
    sprite_index = spr_inimigo_attack;
    ataque_delay -= 1;
  }

  // Atacando
  // Se está no campo de visão
  if (_distance_to_player < fov_radius_attack) {
    // E meu crometro de ataque zerou => realizo o ataque
    if (ataque_pode_atacar == 0) {
      // Inicio o meu ataque
      ataque_pode_atacar = ataque_tempo;
      ataque_delay = 14;
    }
  }
}

function enemy_state_hit() {
	sprite_index = spr_inimigo_hit;
	taking_hit = true;
  if image_index >= image_number-1 {
    state = enemy_state_free;
		taking_hit = false;
  }
}
