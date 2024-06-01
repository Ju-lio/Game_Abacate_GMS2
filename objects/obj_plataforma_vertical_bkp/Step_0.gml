plataforma_velocidade_vertical = plataforma_direcao * plataforma_velocidade;

if (place_meeting(x,y+sign(plataforma_velocidade_vertical),obj_chao)) {
	plataforma_direcao *= -1;
}

var _colidindo_player = place_meeting(x,y+1,obj_player) || place_meeting(x,y-1,obj_player);

if (_colidindo_player) {
	with (obj_player) {
		y += other.plataforma_velocidade_vertical
  }
}

y += plataforma_velocidade_vertical;