event_inherited();

send_place_signal("pathfind");

state = pathfinderStates.wander;

next = NONE; //NONE means not evaluated yet, [] means nowhere to go next
moving = [false, false];

spd = 1;

event_user(0);

wanderDist = RAND_WANDER;
wanderDelay = 0;
wanderX = 0;
wanderY = 0;
setup_wander();