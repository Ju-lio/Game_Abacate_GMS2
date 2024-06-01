if !(instance_exists(obj_player)){
	exit;
}

plataforma_velocidade_vertical = plataforma_direcao * plataforma_velocidade;

//if (place_meeting(x,y+sign(plataforma_velocidade_vertical),obj_chao)) {
//	plataforma_direcao *= -1;
//}

var _colidindo_player = place_meeting(x,y-1,obj_player) || place_meeting(x,y-1,obj_player);

if (_colidindo_player) {
	with (obj_player) {
		y += other.plataforma_velocidade_vertical;
  }
}

y += plataforma_velocidade_vertical;

if instance_exists(obj_player) {
	if(bbox_top >= obj_player.bbox_bottom - 1) {
		sprite_index = spr_plataforma_one_way;
	} else {
		sprite_index = -1;
	}
}