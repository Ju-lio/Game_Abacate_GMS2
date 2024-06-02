event_inherited()
player_life = 200;


// Pulo
player_pulo_max = 2;
player_pulo_count = player_pulo_max -1;
player_pulo_altura = 6;
player_coyote_time = 0;
player_coyote_time_max = 10;

// Dash
player_dash = true;
player_dash_delay = 15;
player_dash_forca = 6;
player_dash_time = 0;
player_dash_distancia = 14;
player_dash_max = 1;
player_dash_count = player_dash_max; 

// Ataque
player_atacando = false;

// Estado
player_free = true;
state = player_state_free;

// Testes
permite_colisao = false;

fov_angle_attack = 15; // Ângulo de visão em graus
fov_radius_attack = 15; // Raio de visão