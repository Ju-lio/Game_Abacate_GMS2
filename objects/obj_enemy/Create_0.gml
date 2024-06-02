event_inherited();

fov_angle = 60; // Ângulo de visão em graus
fov_radius = 60; // Raio de visão

fov_angle_attack = 30; // Ângulo de visão em graus
fov_radius_attack = 30; // Raio de visão

// Supondo que o inimigo esteja criado sobre a plataforma
left_limit = x - 100;  // Ajuste conforme necessário
right_limit = x + 100; // Ajuste conforme necessário

// Ataque
attack_delay_max = 14;
attack_delay = 0;
attack_time = 60;
can_attack = 0; // se 0 pode;
attack_damage = false;

// Vida
life_max = 3;
life = life_max;
in_hit = false;

state = enemy_state_free;