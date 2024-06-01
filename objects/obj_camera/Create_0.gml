global.view_target = obj_player;

window_set_size(VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE)
surface_resize(application_surface,VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE)
alarm[0] = 1;

camera_set_view_size(view_camera[VIEW],VIEW_WIDTH,VIEW_HEIGHT)


gpu_set_texfilter(false);