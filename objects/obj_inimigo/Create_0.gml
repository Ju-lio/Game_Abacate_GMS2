fov_angle = 60; // Ângulo de visão em graus
fov_radius = 60; // Raio de visão

fov_angle_attack = 30; // Ângulo de visão em graus
fov_radius_attack = 30; // Raio de visão

// Supondo que o inimigo esteja criado sobre a plataforma
left_limit = x - 100;  // Ajuste conforme necessário
right_limit = x + 100; // Ajuste conforme necessário

// Ataque
ataque_delay_max = 14;
ataque_delay = 0;
ataque_tempo = 60;
ataque_pode_atacar = 0; // se 0 pode;
ataque_dano = false;

state = enemy_state_free;