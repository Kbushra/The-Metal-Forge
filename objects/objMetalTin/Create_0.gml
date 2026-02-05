event_inherited();
time = 0;
wanderDist = RAND_WANDER/4;
wanderDelay = 0;

state = choose(pathfinderStates.wander, pathfinderStates.pathfind);
if state == pathfinderStates.pathfind { image_blend = c_red; }