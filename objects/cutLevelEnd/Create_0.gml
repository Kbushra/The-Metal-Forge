animateTime = 0;
selected = 0;

clickCount = 0;

currLevel = global.currLevel;

var rankCount = 5; //S is excluded
rank = "F";

if !round_won() { rank = "DEAD"; }
else if objProfit.profit >= global.level[currLevel].ranks[rankCount - 1] { rank = "S"; }
else
{
	for (var i = 0; i < rankCount; i++)
	{
		if objProfit.profit >= global.level[currLevel].ranks[i] { continue; }
	
		switch i
		{
			case 0: rank = "F"; break;
			case 1: rank = "D"; break;
			case 2: rank = "C"; break;
			case 3: rank = "B"; break;
			case 4: rank = "A"; break;
		}
		
		break;
	}
}

if round_won()
{
	if objProfit.profit > global.level[currLevel].ranks[0] &&
	global.levelsUnlocked == currLevel + 1 && global.levelsUnlocked < array_length(global.level)
	{ global.levelsUnlocked++; }
	
	if rank_to_num(rank) > rank_to_num(global.levelRanks[currLevel])
	{ global.levelRanks[currLevel] = rank; }
	
	if objProfit.profit > global.levelScores[currLevel]
	{ global.levelScores[currLevel] = objProfit.profit; }
	
	json_write();
}