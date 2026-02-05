if objPlayer.state != playerStates.normal { open = false; y = -sprite_height; exit; }

if global.construct { open = !open; }

if open { y = lerp(y, 0, 0.2); }
else { y = lerp(y, -sprite_height, 0.2); }