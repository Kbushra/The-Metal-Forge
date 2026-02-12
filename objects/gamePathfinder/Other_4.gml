//Always pathfind on entering a room
objPlayer.spawn_in();

sourceX = objPlayer.x;
sourceY = objPlayer.y;
var xInBounds = sourceX >= 0 && sourceX < room_width;
var yInBounds = sourceY >= 0 && sourceY < room_height;
if !xInBounds || !yInBounds { sourceX = room_width/2; sourceY = room_height/2; exit; }

flow_field();