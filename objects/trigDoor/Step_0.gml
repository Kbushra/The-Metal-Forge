offset = lerp(offset, solid ? 0 : 0.5, 0.1);
if destRoom == noone || !animate { exit; }

with (objPlayer)
{
	send_signal(id, "puppet", true);
	if !in_bounds_strict(x, y) { exit; }
	
	if other.dir == HORIZONTAL { y += vsp * spd; }
	if other.dir == VERTICAL { x += hsp * spd; }
	faceDirection = get_dir(other.dir == VERTICAL ? hsp : 0, other.dir == HORIZONTAL ? vsp : 0, axis);
	
	sprite_index = asset_get_index($"sprPlayer{correct_horizontal_dir(faceDirection)}{other.running ? "R" : ""}");
}