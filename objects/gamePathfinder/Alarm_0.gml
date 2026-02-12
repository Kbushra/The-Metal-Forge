///@desc Pathfind
if !got_place_signal("pathfind") && !log { alarm[0] = 1; exit; }

sourceX = objPlayer.x;
sourceY = objPlayer.y;
var xInBounds = sourceX >= 0 && sourceX < room_width;
var yInBounds = sourceY >= 0 && sourceY < room_height;
if !xInBounds || !yInBounds { alarm[0] = 1; exit; }

send_signal(id, "pathfound", true);
flow_field();

alarm[0] = interval;