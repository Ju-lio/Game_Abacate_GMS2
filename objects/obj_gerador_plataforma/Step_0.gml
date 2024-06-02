if enabled = false {
	exit;
}

platform_timer += 1;

if (platform_timer >= platform_spawn_interval) {
	platform_timer = 0;
    
	var _platform_x = irandom_range(min_x, max_x);
	var _platform_y = irandom_range(min_y, max_y);
    
	// Cria a plataforma
	instance_create_layer(_platform_x, _platform_y, "Instances", obj_plataforma_one_way_vertical);
	
	instance_create_layer(_platform_x+(obj_plataforma_one_way_vertical.sprite_width/2), _platform_y+(obj_plataforma_one_way_vertical.sprite_height-(obj_inimigo.sprite_height/2)-1), "Instances", obj_inimigo);
}
