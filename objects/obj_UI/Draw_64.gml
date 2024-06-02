// PLAYER
var _life = "0";

if (instance_exists(obj_player)) {
   _life = string(obj_player.player_life);
}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

draw_text(15, display_get_gui_height()-15,"HP. "+_life);

// INIMIGO
_life = "0";

if (instance_exists(obj_inimigo)) {
   _life = string(obj_inimigo.player_life);
}

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

draw_text(display_get_gui_width()-15, display_get_gui_height()-15,"HP. "+_life);