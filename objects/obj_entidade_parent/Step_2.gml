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
	if(place_meeting(x,y+sign(player_velocidade_vertical),obj_chao)) {
	   player_velocidade_vertical = 0;
	   break;
	} else {
	   y+= sign(player_velocidade_vertical);
	}
}

