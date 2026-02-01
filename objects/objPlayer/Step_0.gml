depth = -bbox_bottom;

spd = global.run ? 2 : 1;

prevHsp = hsp;
prevVsp = vsp;

hsp = (global.right - global.left);
vsp = (global.down - global.up);

solid_collisions();

x += floor(hsp) * spd;
y += floor(vsp) * spd;

var spriteSpd = hsp != 0 || vsp != 0;
if image_speed != spriteSpd { image_index = spriteSpd; }
image_speed = spriteSpd;

sprite_index = asset_get_index($"sprPlayerD{global.run ? "R" : ""}");