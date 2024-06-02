//Velocidade
player_velocidade = 0;
player_velocidade_max = 3;

// Velocidade horizontal
player_velocidade_horizontal = 0;

// Velocidade verticaL
player_velocidade_vertical = 0;
player_velocidade_vertical_min = -6;
player_velocidade_vertical_max = 6;

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

// Física
player_gravidade = 0.3;
player_aceleracao = 0.3;
player_desaceleracao = 0.3;

// Ataque
player_atacando = false;

// Vida
player_life_max = 3;
player_life = player_life_max;
player_hit = false;

// Outros
player_pode_mover = 0; // Se 0 = Pode
player_direcao = 0;
player_x_scale = 1;
player_y_scale = 1;
player_free = true;

state = player_state_free;

// Testes
permite_colisao = false;

fov_angle_attack = 15; // Ângulo de visão em graus
fov_radius_attack = 15; // Raio de visão

