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

if (instance_exists(obj_player)) {
	if bbox_top >= obj_player.bbox_bottom - 1 {
	  obj_player.permite_colisao = true;
	  if y + bbox_bottom <= other.y {
	      // Ajuste a posição para ficar exatamente em cima da plataforma
	      //y = other.y - bbox_bottom;
	      //player_velocidade_horizontal = 0; // Parar a velocidade vertical
	  }
	} else {
	  obj_player.permite_colisao = false
	}
}

y += plataforma_velocidade_vertical;