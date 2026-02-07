var prevProfit = profit;
profit = 0;

for (var i = 0; i < resourceNames.length; i++)
{
	profit += global.resourceCount[i] * global.resource[i].sell;
}

if profit != prevProfit { instance_create_depth(x, y, depth, objProfitChange, { amt: profit - prevProfit }); }