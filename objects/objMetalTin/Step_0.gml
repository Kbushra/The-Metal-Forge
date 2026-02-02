depth = -bbox_bottom;

if state == pathfinderStates.puppet { exit; }

if state == pathfinderStates.wander
{
	wanderDelay--;
	if wanderDelay > 0
	{
		image_index = 0;
		image_speed = 0;
		exit;
	}
	
	if !done_action("wander_setup")
	{
		wanderX = 0;
		wanderY = 0;
		setup_wander();
		image_index = 1;
		xstart = x;
		ystart = y;
	}
	
	x = lerp(x, xstart + wanderX * spd * 32, 0.1);
	y = lerp(y, ystart + wanderY * spd * 32, 0.1);
	wanderDist -= spd;
	if wanderDist > 0
	{
		image_speed = image_index >= 1;
		exit;
	}
	
	wanderDist = RAND_WANDER;
	wanderDelay = RAND_WANDER;
	reset_action("wander_setup");
	
	exit;
}

if state != pathfinderStates.pathfind { exit; }

wanderDist = RAND_WANDER;
wanderDelay = RAND_WANDER;

reset_action("wander_setup");

var tileX = floor(x / gamePathfinder.tileSize);
var tileY = floor(y / gamePathfinder.tileSize);
tileX = clamp(tileX, 0, array_length(gamePathfinder.nodes) - 1);
tileY = clamp(tileY, 0, array_length(gamePathfinder.nodes[tileX]) - 1);

if !array_equals(moving, [false, false]) //Go to tile
{
	//Can't pathfind with nowhere to go
	if array_length(next) == 0 { moving = [false, false]; state = pathfinderStates.wander; exit; }
	
	x = lerp(x, next[0], 0.1);
	y = lerp(y, next[1], 0.1);
	moving = [!near_equals(x, next[0], 2), !near_equals(y, next[1], 2)];
	image_speed = image_index >= 1;
	exit;
}

image_index = 1;

var node = gamePathfinder.nodes[tileX][tileY];

//Go to next tile
next = node.next;
moving = [true, true];
if array_length(next) > 0
{
	var randNode = irandom(array_length(next) - 1);
	next = next[randNode];
}