draw_self()

if global.game_debug {
	draw_set_alpha(.2)

	// Desenha o raio de visão
	draw_set_color(c_yellow)
	draw_circle(x, y, fov_radius, false);

	// Desenha o raio de visão
	draw_set_color(c_red)
	draw_circle(x, y, fov_radius_attack, false);


	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(x-32,y-32,ataque_pode_atacar/60)
	draw_text(x+32,y-32,ataque_delay)
	
	//draw_text(x+32,y-48,(_distance_to_player < fov_radius_attack));
	draw_text(x+32,y-48,ataque_dano);
}
