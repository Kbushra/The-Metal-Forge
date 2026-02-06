event_user(0);
hsp = 0;
vsp = 0;
prevHsp = 0;
prevVsp = 0;

moving = false;
firstDirection = "";
stillDirection = "D";
faceDirection = "D";
axis = VERTICAL;

knockbackX = 0;
knockbackY = 0;
knockbackTime = 1;

state = playerStates.normal;

instance_create_depth(x, y, depth, objGhost, { origin: id });

showColl = false;