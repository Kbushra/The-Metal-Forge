///@desc Spawn pellet
if round_won() { exit; }

instance_create_depth(x, y, depth - 1, objIonisedPellet);
alarm[1] = irandom_range(20, 30);