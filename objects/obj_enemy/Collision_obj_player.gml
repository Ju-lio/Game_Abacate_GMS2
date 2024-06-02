if instance_exists(obj_player) {
  if attack_damage {
		if (!obj_player.player_hit) {
      obj_player.player_life -= 1;
      obj_player.image_index = 0;
			obj_player.player_free = false;
  		obj_player.state = player_state_hit;
		}
	}

  //if obj_player.player_atacando {
  //  if (!in_hit) {
	//		life -= 1;
	//		image_index = 0;
  //		state = enemy_state_hit;
	//	}
  //}
}