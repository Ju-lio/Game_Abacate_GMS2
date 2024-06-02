// MOVIMENTAÇÃO VERTICAL
player_velocidade_vertical += player_gravidade;
player_velocidade_vertical = clamp(player_velocidade_vertical, player_velocidade_vertical_min, player_velocidade_vertical_max);