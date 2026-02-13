animateTime = 0;
selected = 0;

clickCount = 0;

currLevel = global.currLevel;

var rankCount = 5; //S is excluded
rank = "F";

if !round_won() { rank = "DEAD"; }
else { rank = objProfit.rank; }

if round_won()
{
	if objProfit.profit > global.level[currLevel].ranks[0] &&
	global.levelsUnlocked == currLevel + 1
	{
		if global.levelsUnlocked < array_length(global.level) { global.levelsUnlocked++; }
		else { global.completed = true; }
	}
	
	if rank_to_num(rank) > rank_to_num(global.levelRanks[currLevel])
	{ global.levelRanks[currLevel] = rank; }
	
	if objProfit.profit > global.levelScores[currLevel]
	{ global.levelScores[currLevel] = objProfit.profit; }
	
	json_write();
}