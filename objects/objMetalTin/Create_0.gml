event_inherited();
time = 0;
wanderDist = RAND_WANDER/4;
wanderDelay = irandom(20);

spd = random_range(0.07, 0.13);

state = choose(pathfinderStates.wander, pathfinderStates.pathfind);
image_blend = state == pathfinderStates.pathfind ? c_red : c_white;