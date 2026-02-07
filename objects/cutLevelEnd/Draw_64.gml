draw_set_alpha(exponential_out(0, 1, animateTime, 4));

draw_sprite(sprReceipt, 0, GAME_WIDTH/2,
	exponential_out(GAME_HEIGHT/2 - 20, GAME_HEIGHT/2, animateTime, 4));

draw_set_alpha(1);

animateTime += 0.02;
if animateTime < 1.5 { exit; }

draw_set_halign(fa_middle);
draw_set_colour(c_black);
draw_text(GAME_WIDTH/2, 40, $"Level {global.currLevel + 1}\n{global.level[global.currLevel].name}");

if animateTime < 2.5 { draw_reset(); exit; }

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

draw_text(GAME_WIDTH/2 - 64 + 10, 70 + 10*count, $"TOTAL: ${objProfit.profit}");

if animateTime < 3.5 + 0.1*resourceNames.length { draw_reset(); exit; }

//Died
if objBreakerPanel.image_index == 0
{
	draw_text(GAME_WIDTH/2 - 64 + 10, 90 + 10*count, $"RANK: DEAD");
	draw_text_ext(GAME_WIDTH/2 - 64 + 10, 100 + 10*count, global.level[global.currLevel].comments[0], 10, 100);
	exit;
}

var rankCount = 5; //S is excluded

//S-Rank
if objProfit.profit >= global.level[global.currLevel].ranks[rankCount - 1]
{
	draw_text(GAME_WIDTH/2 - 64 + 10, 90 + 10*count, $"RANK: S");
	draw_text_ext(GAME_WIDTH/2 - 64 + 10, 100 + 10*count, global.level[global.currLevel].comments[rankCount], 10, 100);
	exit;
}

for (var i = 0; i < rankCount; i++)
{
	if objProfit.profit >= global.level[global.currLevel].ranks[i] { continue; }
	
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
	draw_text_ext(GAME_WIDTH/2 - 64 + 10, 100 + 10*count, global.level[global.currLevel].comments[i], 10, 100);
	break;
}

draw_reset();