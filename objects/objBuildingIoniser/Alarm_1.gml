///@desc Spawn pellet
if objBreakerPanel.image_index == 1 { exit; }

instance_create_depth(x, y, depth - 1, objIonisedPellet);
alarm[1] = irandom_range(60, 90);