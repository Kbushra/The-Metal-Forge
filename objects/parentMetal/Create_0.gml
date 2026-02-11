shake = 0;
hp = 100;
maxHp = 100;

state = pathfinderStates.wander;

vibration = play_sfx(sfxVibrate, 0, , true);

ghost = instance_create_depth(x, y, depth, objGhost, { origin: id });