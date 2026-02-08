animateTime = 0;
selected = 0;

clickCount = 0;

currLevel = global.currLevel;

if objBreakerPanel.image_index == 1 && objProfit.profit > global.level[currLevel].ranks[0] &&
global.levelsUnlocked == currLevel + 1 && global.levelsUnlocked < array_length(global.level)
{
	global.levelsUnlocked++;
	json_write();
}