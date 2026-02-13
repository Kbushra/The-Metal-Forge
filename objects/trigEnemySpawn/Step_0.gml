if alarm[0] > 180 && instance_number(parentMetal) < swarmMax { alarm[0] = 180; }
if alarm[0] <= 60 && alarm[0] > 0 { image_speed = 1; }

if image_index >= image_number - 1 { image_index = image_number - 1; }

part_system_depth(spawnPs, -y);