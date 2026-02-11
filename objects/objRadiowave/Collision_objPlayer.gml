if round_won() { exit; }

if !other.knock(dcos(image_angle), -dsin(image_angle), speed * 10, image_xscale * 15) { exit; }

split();
instance_destroy();