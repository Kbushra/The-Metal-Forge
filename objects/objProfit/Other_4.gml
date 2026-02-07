profit = 0;

for (var i = 0; i < resourceNames.length; i++)
{
	profit += global.resourceCount[i] * global.resource[i].sell;
}