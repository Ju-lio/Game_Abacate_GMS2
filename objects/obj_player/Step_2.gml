//END STEP

if (player_life <= 0) && image_index >= image_number-1 {
	instance_destroy();
}

repeat(abs(player_velocidade_horizontal)) {
	
	// SUBIR RAMPA // COLISAO HORIZONTAL
	if(place_meeting(x+sign(player_velocidade_horizontal),y,obj_chao)) {
		if(!place_meeting(x,y-1,obj_chao)) {
			if(!place_meeting(x+sign(player_velocidade_horizontal),y-2,obj_chao)) {
				y--;
			}
		}
	} else {
		if(!place_meeting(x,y+1,obj_chao)) {
			if(place_meeting(x,y+2,obj_chao)) {
				y++;
			}
		}
	}
	
	if(place_meeting(x+sign(player_velocidade_horizontal),y,obj_chao)) {
		player_velocidade_horizontal = 0;
	  	break;
	} else {
		x+= sign(player_velocidade_horizontal);
	}
}

// COLISAO VERTICAL
repeat(abs(player_velocidade_vertical)) {
	
	var _plataform_collision = noone;
	var _bplataform_collision = false;
	
	_plataform_collision = instance_place(x, y+(player_velocidade_vertical), obj_platform);
	if _plataform_collision != noone {
		_bplataform_collision = (_plataform_collision.bbox_top >= bbox_bottom);
	}
	
	if(place_meeting(x,y+sign(player_velocidade_vertical),obj_chao)) || _bplataform_collision {
		player_velocidade_vertical = 0;
		break;
	} else {
		y+= sign(player_velocidade_vertical);
	}
}