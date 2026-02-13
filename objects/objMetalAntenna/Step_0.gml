depth = -bbox_bottom;

if state == pathfinderStates.puppet { exit; }

state = distance_to_object(objPlayer) > range ? pathfinderStates.pathfind : pathfinderStates.wander;

if !in_bounds_strict(objPlayer.x, objPlayer.y) { state = pathfinderStates.wander; }

if state == pathfinderStates.wander
{
	image_speed = 0;
	image_index = 0;
	set_shake(1);
	
	if alarm[0] <= 0 { alarm[0] = RAND_WANDER; }
}

if state != pathfinderStates.pathfind { exit; }

alarm[0] = -1;
image_speed = 1;

wanderDist = RAND_WANDER;
wanderDelay = RAND_WANDER;

var tileX = floor(x / gamePathfinder.tileSize);
var tileY = floor(y / gamePathfinder.tileSize);
tileX = clamp(tileX, 0, array_length(gamePathfinder.nodes) - 1);
tileY = clamp(tileY, 0, array_length(gamePathfinder.nodes[tileX]) - 1);

if !array_equals(moving, [false, false]) //Go to tile
{
	//Can't pathfind with nowhere to go
	if array_length(next) == 0 || !place_free(next[0], next[1])
	{
		moving = [false, false];
		state = pathfinderStates.wander;
		exit;
	}
	
	axis = get_axis_from_spd(next[0] - x, next[1] - y);
	dir = get_dir(next[0] - x, next[1] - y, axis);
	
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
	
	play_sfx(sfxStep2);
}