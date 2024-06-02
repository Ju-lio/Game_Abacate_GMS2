draw_sprite_ext(sprite_index,image_index,x,y,player_x_scale,player_y_scale,0,c_white,1);

if global.game_debug {
	draw_set_alpha(.2)

	// Desenha o raio de visão
	draw_set_color(c_red)	
	draw_circle(x+(sprite_height/2), y-(sprite_height/2), fov_radius_attack, false);

	// draw_set_alpha(1);
	// draw_set_color(c_white);
	// draw_text(x-32,y-32,ataque_pode_atacar/60)
	// draw_text(x+32,y-32,ataque_delay)
}
