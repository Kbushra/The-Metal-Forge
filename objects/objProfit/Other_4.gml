profit = 0;
rank = "F";

for (var i = 0; i < resourceNames.length; i++)
{
	profit += global.resourceCount[i] * global.resource[i].sell;
}