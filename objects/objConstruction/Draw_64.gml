draw_self();

if array_length(availableBuildings) == 0 { exit; }

animateTime++;

draw_sprite(availableBuildings[selected].icon, 0, x - sprite_width/2 + 40, y + sprite_height/2);

//Right arrow
if selected < array_length(availableBuildings) - 1
{
	draw_sprite_ext(sprArrow, 0, x - sprite_width/2 + 56 + 4 + (animateTime % 30 <= 15), y + sprite_height/2,
		1, 1, 0, c_white, 1);
}

//Left arrow
if selected > 0
{
	draw_sprite_ext(sprArrow, 0, x - sprite_width/2 + 24 - 4 - (animateTime % 30 <= 15), y + sprite_height/2,
		-1, 1, 0, c_white, 1);
}

draw_set_font(fntSmall);

var reqResources = availableBuildings[selected].resourceTypes;
for (var i = 0; i < array_length(reqResources); i++)
{
	var row = i div 2;
	var col = i % 2;
	draw_sprite(global.resource[reqResources[i]].icon, 0, x + 4 + 40*col, y + 8 + 10*row);
	
	var obtained = global.resourceCount[reqResources[i]];
	var required = availableBuildings[selected].resourceQuantities[i];
	draw_set_colour(obtained < required ? c_red : c_white);
	draw_text(x + 10 + 40*col, y + 2 + 10*row, $"{obtained}/{required}");
	draw_set_colour(c_white);
}

draw_text_ext_transformed(x, y + 19 + 10*((array_length(reqResources) - 1) div 2),
	availableBuildings[selected].desc, 10, 150, 0.5, 0.5, 0);

draw_set_halign(fa_middle);
draw_set_colour(instance_number(availableBuildings[selected].obj) >=
	availableBuildings[selected].count ? c_red : c_white);

draw_text_transformed(x - sprite_width/2 + 40, y + sprite_height/2 + 16,
	$"{instance_number(availableBuildings[selected].obj)}/{availableBuildings[selected].count}",
		0.5, 0.5, 0);

draw_reset();