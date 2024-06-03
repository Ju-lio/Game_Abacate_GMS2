event_inherited();

if (in_hit) && (life == 0) {  
  gpu_set_fog(true,c_red,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_orange,0.75);
	gpu_set_fog(false,c_red,0,0);
}