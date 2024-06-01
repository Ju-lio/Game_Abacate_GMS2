function attack_player(_player) {
	// Exemplo de movimento em direção ao jogador:
	var _move_speed = 2; // Velocidade de movimento do inimigo
	var _direction_to_player = point_direction(x, y, _player.x, _player.y);
	var _move_x = lengthdir_x(_move_speed, _direction_to_player);

  //x += _move_x;
}