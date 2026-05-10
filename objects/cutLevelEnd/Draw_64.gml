draw_set_alpha(exponential_out(0, 1, animateTime, 4));

draw_sprite(sprReceipt, 0, GAME_WIDTH/2,
	exponential_out(GAME_HEIGHT/2 - 20, GAME_HEIGHT/2, animateTime, 4));

draw_set_alpha(1);

animateTime += 0.02;
if animateTime < 1.5 { exit; }

if clickCount == 0 { play_sfx(sfxClick); clickCount++; }

draw_set_halign(fa_middle);
draw_set_colour(c_black);
draw_text(GAME_WIDTH/2, 30, $"Level {currLevel}\n{global.level[currLevel].name}");

if animateTime < 2.5 { draw_reset(); exit; }

draw_set_halign(fa_left);

var count = 0;
for (var i = 0; i < resourceNames.length; i++)
{
	if global.resourceCount[i] == 0 { continue; }
	if animateTime < 2.5 + 0.1*i { break; }
	
	draw_text(GAME_WIDTH/2 - 64 + 10, 60 + 10*count,
		$"{global.resourceCount[i]}x{global.resource[i].name} - ${global.resource[i].sell * global.resourceCount[i]}");
	
	count++;
	
	if clickCount == count { play_sfx(sfxClick); clickCount++; }
}

if animateTime < 2.5 + 0.1*resourceNames.length { draw_reset(); exit; }

if clickCount == 1 + count { play_sfx(sfxClick); clickCount++; }

draw_text(GAME_WIDTH/2 - 64 + 10, 60 + 10*count, $"TOTAL: ${objProfit.profit}");

if animateTime < 3.5 + 0.1*resourceNames.length { draw_reset(); exit; }

if clickCount == 2 + count { play_sfx(sfxClick); clickCount++; }

draw_text(GAME_WIDTH/2 - 64 + 10, 80 + 10*count, $"RANK: {rank}");
draw_text_ext(GAME_WIDTH/2 - 64 + 10, 90 + 10*count, global.level[currLevel].comments[rank_to_num(rank)], 10, 100);

if animateTime < 5.5 + 0.1*resourceNames.length { draw_reset(); exit; }

if clickCount == 3 + count { play_sfx(sfxClick); clickCount++; }

var ids = [NONE, 0, 1];
var options = ["Restart", "Menu"];
if global.levelsUnlocked > currLevel + 1
{
	array_insert(options, 0, "Continue");
	ids = array_map(ids, function(element) { return element + 1; });
}

script_execute_ext(draw_list, array_concat([GAME_WIDTH/2 - 64 + 10, GAME_HEIGHT/2 + 74, 10, selected], options));

draw_reset();

if instance_exists(cutTransition) { exit; }

if global.downPress { selected++; play_sfx(sfxClickMove); }
if global.upPress { selected--; play_sfx(sfxClickMove); }
selected = (selected + array_length(options)) % array_length(options);

if !global.confirm { exit; }

play_sfx(sfxClick);

if selected == ids[0]
{
	room_transition(asset_get_index($"rmLevel{currLevel + 1}"));
	global.currLevel++;
}
else if selected == ids[1] { room_transition(room); }
else if selected == ids[2] { room_transition(rmMenu); }