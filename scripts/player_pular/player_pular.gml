function player_pular(){
	player_coyote_time = 0;
	player_pulo_count -= 1;
	player_velocidade_vertical = 0;
	player_velocidade_vertical -= player_pulo_altura;
}