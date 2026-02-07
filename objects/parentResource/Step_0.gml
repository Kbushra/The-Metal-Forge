depth = -bbox_bottom;

if !bouncing { exit; }

vsp += 0.1;

var signH = sign(hsp);
var signV = sign(vsp);
while !place_free(x + hsp, y) && sign(hsp) == signH && signH != 0 { hsp -= signH; }
while !place_free(x, y + vsp) && sign(vsp) == signV && signV != 0 { vsp -= signV; }

while !place_free(x + hsp, y + vsp) &&
sign(hsp) == signH && sign(vsp) == signV && signH != 0 && signV != 0
{ hsp -= signH; vsp -= signV; }

x += hsp;
y += vsp;

if y >= ystart { vsp = -vsp/2; hsp /= 2; }
y = clamp(y, 0, ystart);