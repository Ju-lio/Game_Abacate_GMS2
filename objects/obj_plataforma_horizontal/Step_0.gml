plataforma_velocidade_horizontal = plataforma_direcao * plataforma_velocidade;

if (place_meeting(x+sign(plataforma_velocidade_horizontal),y,obj_chao)) {
	plataforma_direcao *= -1;
}

var _colidindo_player = place_meeting(x+sign(plataforma_velocidade_horizontal),y,obj_player) || place_meeting(x,y-1,obj_player);

if (_colidindo_player) {
	with (obj_player) {
		if (!place_meeting(x+other.plataforma_velocidade_horizontal,y,obj_chao)) {
			x+=other.plataforma_velocidade_horizontal;
		}
  }
}

x += plataforma_velocidade_horizontal;