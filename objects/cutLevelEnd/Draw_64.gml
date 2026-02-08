draw_set_alpha(exponential_out(0, 1, animateTime, 4));

draw_sprite(sprReceipt, 0, GAME_WIDTH/2,
	exponential_out(GAME_HEIGHT/2 - 20, GAME_HEIGHT/2, animateTime, 4));

draw_set_alpha(1);

animateTime += 0.02;
if animateTime < 1.5 { exit; }

if clickCount == 0 { play_sfx(sfxClick); clickCount++; }

draw_set_halign(fa_middle);
draw_set_colour(c_black);
draw_text(GAME_WIDTH/2, 40, $"Level {currLevel}\n{global.level[currLevel].name}");

if animateTime < 2.5 { draw_reset(); exit; }

if clickCount == 1 { play_sfx(sfxClick); clickCount++; }

draw_set_halign(fa_left);

var count = 0;
for (var i = 0; i < resourceNames.length; i++)
{
	if global.resourceCount[i] == 0 { continue; }
	if animateTime < 2.5 + 0.1*i { break; }
	
	draw_text(GAME_WIDTH/2 - 64 + 10, 70 + 10*count,
		$"{global.resourceCount[i]}x{global.resource[i].name} - ${global.resource[i].sell * global.resourceCount[i]}");
	
	count++;
}

if animateTime < 2.5 + 0.1*resourceNames.length { draw_reset(); exit; }

if clickCount == 2 { play_sfx(sfxClick); clickCount++; }

draw_text(GAME_WIDTH/2 - 64 + 10, 70 + 10*count, $"TOTAL: ${objProfit.profit}");

if animateTime < 3.5 + 0.1*resourceNames.length { draw_reset(); exit; }

if clickCount == 3 { play_sfx(sfxClick); clickCount++; }

var rankCount = 5; //S is excluded

if objBreakerPanel.image_index == 0 //Died
{
	draw_text(GAME_WIDTH/2 - 64 + 10, 90 + 10*count, $"RANK: DEAD");
	draw_text_ext(GAME_WIDTH/2 - 64 + 10, 100 + 10*count, global.level[currLevel].comments[0], 10, 100);
}
else if objProfit.profit >= global.level[currLevel].ranks[rankCount - 1] //S-Rank
{
	draw_text(GAME_WIDTH/2 - 64 + 10, 90 + 10*count, $"RANK: S");
	draw_text_ext(GAME_WIDTH/2 - 64 + 10, 100 + 10*count, global.level[currLevel].comments[rankCount], 10, 100);
}
else
{
	for (var i = 0; i < rankCount; i++)
	{
		if objProfit.profit >= global.level[currLevel].ranks[i] { continue; }
	
		var rank = "F";
	
		switch i
		{
			case 0: rank = "F"; break;
			case 1: rank = "D"; break;
			case 2: rank = "C"; break;
			case 3: rank = "B"; break;
			case 4: rank = "A"; break;
		}
	
		draw_text(GAME_WIDTH/2 - 64 + 10, 90 + 10*count, $"RANK: {rank}");
		draw_text_ext(GAME_WIDTH/2 - 64 + 10, 100 + 10*count, global.level[currLevel].comments[i], 10, 100);
		break;
	}
}

if animateTime < 5.5 + 0.1*resourceNames.length { draw_reset(); exit; }

if clickCount == 4 { play_sfx(sfxClick); clickCount++; }

var options = ["Menu", "Restart"];
if global.levelsUnlocked > currLevel + 1 { array_push(options, "Continue"); }
script_execute_ext(draw_list, array_concat([GAME_WIDTH/2 - 64 + 10, 140 + 10*count, 10, selected], options));

draw_reset();

if instance_exists(cutTransition) { exit; }

if global.downPress { selected++; }
if global.upPress { selected--; }
selected = (selected + array_length(options)) % array_length(options);

if !global.confirm { exit; }

if selected == 0 { room_transition(rmMenu); }
if selected == 1 { room_transition(room); }
if selected == 2
{
	room_transition(asset_get_index($"rmLevel{currLevel + 1}"));
	global.currLevel++;
}