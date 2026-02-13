shake = 0;
maxHp = 100 * (raised_difficulty() ? 1.5 : 1);
hp = maxHp;

state = pathfinderStates.wander;

vibration = play_sfx(sfxVibrate, 0, , true);

ghost = instance_create_depth(x, y, depth, objGhost, { origin: id });