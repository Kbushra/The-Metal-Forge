event_inherited();

radiationPs = part_system_create(psRadiation);

beam = noone;

alarm[0] = RAND_WANDER * 2;

x += random_range(-5, 5);
y += random_range(-5, 5);
hsp = choose(-1, 1);
vsp = choose(-1, 1);
spd = 2;