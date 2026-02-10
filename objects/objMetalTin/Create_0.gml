event_inherited();
time = 0;
wanderDist = RAND_WANDER/4;
wanderDelay = irandom(20);

spd = random_range(0.07, 0.13);

state = choose(pathfinderStates.wander, pathfinderStates.pathfind);
if state == pathfinderStates.pathfind { image_blend = c_red; }