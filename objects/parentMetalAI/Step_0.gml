depth = -bbox_bottom;

if state == pathfinderStates.puppet { exit; }

if state == pathfinderStates.wander
{
	wanderDelay--;
	if wanderDelay > 0
	{
		sprite_index = asset_get_index($"spr{name}{correct_horizontal_dir(dir)}");
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
	}
	
	x += wanderX * spd;
	y += wanderY * spd;
	wanderDist -= spd;
	if wanderDist > 0
	{
		sprite_index = asset_get_index($"spr{name}{correct_horizontal_dir(dir)}");
		image_speed = 1;
		exit;
	}
	
	wanderDist = RAND_WANDER;
	wanderDelay = RAND_WANDER;
	reset_action("wander_setup");
	
	exit;
}

if state != pathfinderStates.pathfind { exit; }

image_speed = 1;

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
	if array_length(next) == 0
	{
		moving = [false, false];
		state = pathfinderStates.wander;
		exit;
	}
	
	axis = get_axis_from_spd(next[0] - x, next[1] - y);
	dir = get_dir(next[0] - x, next[1] - y, axis);
	sprite_index = asset_get_index($"spr{name}{correct_horizontal_dir(dir)}");
	
	moving = move_towards_point_overworld(next[0], next[1], spd, moving);
	exit;
}

var node = gamePathfinder.nodes[tileX][tileY];

//Go to next tile
next = node.next;
moving = [true, true];
if array_length(next) > 0
{
	var randNode = irandom(array_length(next) - 1);
	next = next[randNode];
}