time = 0;
beamed = false;
lineWidths = [];

deal_damage = function()
{
	if !beamed { return; }
	objBarHealth.deal_damage(0.5);
}