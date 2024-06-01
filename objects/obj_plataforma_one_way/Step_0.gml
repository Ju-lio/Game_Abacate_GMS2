if instance_exists(obj_player) {
	if(bbox_top >= obj_player.bbox_bottom - 1) {
		sprite_index = spr_plataforma_one_way;
	} else {
		sprite_index = -1;
	}
} else {
	sprite_index = spr_plataforma_one_way;
}