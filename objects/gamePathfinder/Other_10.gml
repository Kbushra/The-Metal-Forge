///@desc Methods

///@func neighbours(tileX, tileY)
function neighbours(tileX, tileY)
{
	var new_arr = [];
	
	for (var i = -1; i <= 1; i++)
	{
		for (var j = -1; j <= 1; j++)
		{
			if (i == 0 && j == 0) { continue; }
			
			var coll = !place_free(tileSize/2 + (tileX + i) * tileSize,
			tileSize/2 + (tileY + j) * tileSize);
			
			//Adjacent tile on X not colliding
			coll = coll || !place_free(tileSize/2 + (tileX + i) * tileSize,
			tileSize/2 + tileY * tileSize);
			
			//Adjacent tile on Y not colliding
			coll = coll || !place_free(tileSize/2 + tileX * tileSize,
			tileSize/2 + (tileY + j) * tileSize);
			
			var xInBounds = false;
			var yInBounds = false;
			xInBounds = tileX + i >= 0 && tileX + i < array_length(nodes);
			if xInBounds { yInBounds = tileY + j >= 0 && tileY + j < array_length(nodes[tileX + i]); }
			
			if (xInBounds && yInBounds && !coll) { array_push(new_arr, [tileX + i, tileY + j]); }
		}
	}
	
	return new_arr;
}

///@func set_weights(tileX, tileY, neighbours)
function set_weights(tileX, tileY, nbs)
{
	var changedNbs = [];
	
	for (var i = 0; i < array_length(nbs); i++)
	{
		var nbInds = nbs[i];
		var distX = nbInds[0] - tileX;
		var distY = nbInds[1] - tileY;
		var dist = sqrt(power(distX, 2) + power(distY, 2));
		
		var finalWeight = nodes[tileX][tileY].weight + dist;
		var targNode = nodes[nbInds[0]][nbInds[1]];
		
		if (targNode.weight != NONE && targNode.weight <= finalWeight) { continue; }
		
		if finalWeight > maxWeight { maxWeight = finalWeight; }
		
		var toEnd = sqrt(power(sourceTileX - nbInds[0], 2) + power(sourceTileY - nbInds[1], 2));
		targNode.weight = finalWeight;
		targNode.priority = finalWeight + toEnd;
		array_push(changedNbs, nbInds);
	}
	
	return changedNbs;
}

///@func reset_nodes()
function reset_nodes()
{
	for (var i = 0; i < room_width/tileSize - 0.5; i++)
	{
		for (var j = 0; j < room_height/tileSize - 0.5; j++)
		{
			nodes[i][j] =
			{
				x: tileSize/2 + i*tileSize,
				y: tileSize/2 + j*tileSize,
				weight: NONE,
				priority: NONE,
				next: []
			};
		}
	}
	
	nodes[sourceTileX][sourceTileY].weight = 0;
}

///@func evaluate_weights()
function evaluate_weights()
{
	var queue = [[sourceTileX, sourceTileY]];
	
	var count = 0;
	while (array_length(queue) > 0 && count < 100)
	{
		var newNodes = [];
	
		for (var i = 0; i < array_length(queue); i++)
		{
			var inds = queue[i];
			if point_distance(sourceTileX, sourceTileY, inds[0], inds[1]) > maxDistance { continue; } 
			
			var nbs = neighbours(inds[0], inds[1]);
			var changedNbs = set_weights(inds[0], inds[1], nbs);
			newNodes = array_concat(newNodes, changedNbs);
		}
		
		queue = newNodes;
		array_sort(queue, function(current, next)
		{
			var currentNode = nodes[current[0]][current[1]];
			var nextNode = nodes[next[0]][next[1]];
			return currentNode.priority - nextNode.priority;
		});
		
		count++;
	}
}

///@func retrace_path()
function retrace_path()
{
	for (var i = 0; i < room_width/tileSize - 0.5; i++)
	{
		for (var j = 0; j < room_height/tileSize - 0.5; j++)
		{
			if point_distance(sourceTileX, sourceTileY, i, j) > maxDistance { continue; }
			
			var lowestWeight = noone; //Different from NONE so they don't clash
			var nbs = neighbours(i, j);
			var gotoInd = [];
	
			for (var k = 0; k < array_length(nbs); k++)
			{
				var currentNode = nodes[nbs[k][0]][nbs[k][1]];
				if (currentNode.weight > lowestWeight && lowestWeight != noone) { continue; }
				
				if currentNode.weight == lowestWeight
				{ array_push(gotoInd, [currentNode.x, currentNode.y]); }
				else { gotoInd = [[currentNode.x, currentNode.y]]; }
				
				lowestWeight = currentNode.weight;
			}
			
			nodes[i][j].next = gotoInd;
		}
	}
}

///@func flow_field()
function flow_field()
{
	sourceTileX = floor(sourceX / tileSize);
	sourceTileY = floor(sourceY / tileSize);
	
	if sourceTileX < 0 || sourceTileX > room_width/tileSize - 0.5 ||
	sourceTileY < 0 || sourceTileY > room_height/tileSize - 0.5 { exit; }
	
	if array_length(neighbours(sourceTileX, sourceTileY)) == 0 { exit; }

	reset_nodes();
	evaluate_weights();
	retrace_path();
}