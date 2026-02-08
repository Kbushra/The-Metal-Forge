if hp <= 0 { instance_destroy(); exit; }

var prevBlend = image_blend;
var prevX = x;
var prevY = y;
image_blend = merge_colour(prevBlend, #faacac, shake/5);
x += irandom_range(-shake, shake);
y += irandom_range(-shake, shake);

audio_sound_gain(vibration, (1 - hp/maxHp) * shake/5);

draw_self();

x = prevX;
y = prevY;
image_blend = prevBlend;