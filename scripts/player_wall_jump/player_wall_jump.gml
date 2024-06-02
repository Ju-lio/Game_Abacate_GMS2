function player_walljump(_tecla_pulo, _no_chao, _na_parede, _movimentando, _enabled){
	if (_enabled) {
		if (_na_parede) && (!_no_chao) {
			if (player_velocidade_vertical > 1) && (_movimentando) {
				sprite_index = spr_player_wall;
				player_velocidade_vertical = 1;	
			}
			
			if (_tecla_pulo) {
				player_pular()
				player_pode_mover = 5;
				player_velocidade_horizontal -= 4 * player_x_scale;
			}   
		}
	}
}