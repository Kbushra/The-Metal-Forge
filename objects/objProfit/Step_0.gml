var prevProfit = profit;
profit = 0;

for (var i = 0; i < resourceNames.length; i++)
{
	profit += global.resourceCount[i] * global.resource[i].sell;
}

if profit != prevProfit
{
	instance_create_depth(x, y, depth, objProfitChange, { amt: profit - prevProfit });
	
	var rankCount = 5; //F, D, C, B, A
	var i;
	
	for (i = 0; i < rankCount; i++)
	{
		if profit >= global.level[global.currLevel].ranks[i] { continue; }
	
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
	
	//Went through entire for loop
	if i == rankCount { rank = "S"; }
}