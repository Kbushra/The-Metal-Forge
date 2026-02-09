hsp = irandom_range(-2, 2);
vsp = irandom_range(-3, -2);

x += hsp * 2;
y += vsp * 2;

bouncing = true;
alarm[0] = 120;

ghost = instance_create_depth(0, 0, 0, objGhost, { origin: id });