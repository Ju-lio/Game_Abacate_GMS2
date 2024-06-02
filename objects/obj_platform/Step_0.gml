if !(instance_exists(obj_player)){
	exit;
}
var _colidindo_player = place_meeting(x,y-2,obj_player);

if (_colidindo_player) {
	with (obj_player) {
		y += other.vspd;
  }
}

y += vspd;