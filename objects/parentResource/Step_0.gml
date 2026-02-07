depth = -bbox_bottom;

if !bouncing { exit; }

vsp += 0.1;

if !place_free(x + hsp, y) { hsp = 0; }
if !place_free(x, y + vsp) { vsp = 0; }
if !place_free(x + hsp, y + vsp) { hsp = 0; vsp = 0; }

x += hsp;
y += vsp;

if y >= ystart { vsp = -vsp/2; hsp /= 2; }
y = clamp(y, 0, ystart);