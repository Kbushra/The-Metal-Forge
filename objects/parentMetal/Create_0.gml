shake = 0;
hp = 100;
maxHp = 100;

state = pathfinderStates.wander;

vibration = play_sfx(sfxVibrate, 0);

ghost = instance_create_depth(0, 0, 0, objGhost, { origin: id });