if ataque_dano {
	instance_destroy(other)
}

if instance_exists(obj_player) {
  if obj_player.player_atacando {
    instance_destroy()
  }
}