if objPlayer.state == playerStates.puppet || round_won() { open = false; }
else if global.construct { open = !open; play_sfx(open ? sfxConstructionOpen : sfxConstructionClose); }

if open { y = lerp(y, 0, 0.2); }
else { y = lerp(y, -sprite_height, 0.2); }

if !open { instance_destroy(parentPlacer); exit; }

if global.constructRight && selected < array_length(availableBuildings) - 1 { selected++; play_sfx(sfxClickMove); }
if global.constructLeft && selected > 0 { selected--; play_sfx(sfxClickMove); }

if !instance_exists(availableBuildings[selected].placer) && can_place()
{
	instance_destroy(parentPlacer);
	instance_create_depth(x, y, depth, availableBuildings[selected].placer);
}
else if instance_exists(parentPlacer) && !can_place() { instance_destroy(parentPlacer); }