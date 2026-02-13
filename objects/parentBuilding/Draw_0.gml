if instance_exists(parentPlacer) { alarm[0] = 30; }

if collision_rectangle_extended(x, y, x, y, objPlayer, sprite_width/2 + 5) &&
objPlayer.state == playerStates.normal && !round_won() && alarm[0] <= 0
{ image_blend = c_red; }

draw_self();

if image_blend == c_red
{
	draw_set_halign(fa_middle);
	draw_text(other.x, other.y + other.sprite_height/2 - 5, "Destroy?");
	
	if global.confirm { instance_destroy(); }
}

image_blend = c_white;