event_user(0);
hsp = 0;
vsp = 0;
prevHsp = 0;
prevVsp = 0;

moving = false;
firstDirection = "D";
faceDirection = "D";
axis = VERTICAL;

knockbackX = 0;
knockbackY = 0;
knockbackTime = 1;
invincibilityTime = 0;

state = playerStates.normal;

ghost = instance_create_depth(x, y, depth, objGhost, { origin: id });

showColl = false;