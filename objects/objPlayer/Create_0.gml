event_user(0);
hsp = 0;
vsp = 0;
prevHsp = 0;
prevVsp = 0;

moving = false;
firstDirection = "";
faceDirection = "D";
axis = VERTICAL;

state = playerStates.normal;

instance_create_depth(x, y, depth, objPlayerGhost);

showColl = false;