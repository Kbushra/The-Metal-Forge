///@func setup_wander()
setup_wander = function()
{
	var allowedDirs = [
	[-1, -1], [0, -1], [1, -1],
	[-1, 0],           [1, 0],
	[-1, 1],  [0, 1],  [1, 1]];

	allowedDirs = array_shuffle(allowedDirs);
	
	var prevWanderX = wanderX;
	var prevWanderY = wanderY;
	var lastValidWanderX = 0;
	var lastValidWanderY = 0;
	
	for (var i = 0; i <= array_length(allowedDirs); i++)
	{
		if i == array_length(allowedDirs)
		{
			wanderX = lastValidWanderX;
			wanderY = lastValidWanderY;
			break;
		}
		
		wanderX = allowedDirs[i][0];
		wanderY = allowedDirs[i][1];
		var xOpposites = prevWanderX == wanderX * -1 && wanderX != 0;
		var yOpposites = prevWanderY == wanderY * -1 && wanderY != 0;
		
		//Full reversal is least probable, then opposing 1 direction, then opposing none
		//Chances are a bit different than shown because if all chances fail it'll use the last one
		var chance = xOpposites && yOpposites ? 0.2 : (xOpposites || yOpposites ? 0.6 : 1);
		
		var collided = false;
		var startDist = wanderDist;
		var interruptDist = RAND_WANDER/2;
		
		for (var j = gamePathfinder.tileSize/2; j <= startDist; j += gamePathfinder.tileSize/2)
		{
			var newX = x + wanderX * j;
			var newY = y + wanderY * j;
			
			if !place_free(newX, newY) ||
			collision_point(newX, newY, [trigWanderBlock],
			false, true) != noone
			{
				if j < interruptDist { collided = true; }
				else { wanderDist = j - gamePathfinder.tileSize; }
				break;
			}
		}
		
		if !collided
		{
			//Valid path but failed chance
			if random(1) > chance
			{
				lastValidWanderX = wanderX;
				lastValidWanderY = wanderY;
				continue;
			}
			
			break;
		}
		
	}

	axis = get_axis_from_spd(wanderX, wanderY);
	dir = get_dir(wanderX, wanderY, axis);
}