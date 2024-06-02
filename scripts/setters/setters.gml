function set_state(_new_state, _obj = self){
	self.free = false;
	self.state = _new_state;
}

function set_sprite(_new_sprite, _reset = true, _obj = self){
	if(_reset) self.image_index = 0;
	self.sprite_index = _new_sprite;
}