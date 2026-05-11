x += hsp;
y += vsp;
vsp += 0.1;
image_angle = point_direction(0, 0, hsp, vsp);

if !in_bounds_margin(x, y) && alarm[0] <= 0 { alarm[0] = 60; }