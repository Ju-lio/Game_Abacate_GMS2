// MOVIMENTAÇÃO VERTICAL
player_velocidade_vertical += player_gravidade;
player_velocidade_vertical = clamp(player_velocidade_vertical, player_velocidade_vertical_min, player_velocidade_vertical_max);

// DIRECIONAMENTO DO PLAYER
player_pode_mover = aproximar(player_pode_mover, 0, 0.4);
if (player_pode_mover <= 0) {
	player_velocidade_horizontal = lengthdir_x(player_velocidade, player_direcao);
}

// INVERTER SPRITE DO PLAYER
if(player_velocidade_horizontal != 0) {
	player_x_scale = sign(player_velocidade_horizontal);
}