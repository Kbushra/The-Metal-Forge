hsp = irandom_range(-2, 2);
vsp = irandom_range(-3, -2);

bouncing = true;
alarm[0] = 120;

ghost = instance_create_depth(x, y, depth, objGhost, { origin: id });