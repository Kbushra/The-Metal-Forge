event_inherited();

attackIn = false;
attackOut = false;
attackDelay = 60;

volt = noone;

morph = false;
morphFail = true; //So first attack it tries morphing
morphTimer = 60;
tp = false;

x += random_range(-5, 5);
y += random_range(-5, 5);
targX = x + choose(-32, 32);
targY = y + choose(-32, 32);