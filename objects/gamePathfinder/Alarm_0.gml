///@desc Pathfind
if !got_place_signal("pathfind") && !log && !got_signal("room_start") { alarm[0] = 1; exit; }

sourceX = objPlayer.x;
sourceY = objPlayer.y;
var xInBounds = sourceX >= 0 && sourceX < room_width;
var yInBounds = sourceY >= 0 && sourceY < room_height;
if !xInBounds || !yInBounds { alarm[0] = 1; exit; }

stop_signal("room_start");
send_signal(id, "pathfound", true);
flow_field();

alarm[0] = interval;