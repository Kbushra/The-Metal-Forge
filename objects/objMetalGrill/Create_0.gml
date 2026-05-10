event_inherited();

x += random_range(-5, 5);
y += random_range(-5, 5);

attackIn = false;
attackOut = false;
attackDelay = 60;

volt = noone;

morph = false;
morphFail = true; //So first attack it tries morphing
morphTimer = 60;
tp = false;

targX = x;
targY = y;