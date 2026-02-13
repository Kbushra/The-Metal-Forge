function round_won()
{
	return instance_exists(objBreakerPanel) && objBreakerPanel.image_index == 1;
}

function raised_difficulty()
{
	//Even bigger than S rank
	return objProfit.profit >= global.level[global.currLevel].ranks[4] + 1500;
}

function rank_to_num(rank)
{
	switch rank 
	{
		case "F": return 0;
		case "D": return 1;
		case "C": return 2;
		case "B": return 3;
		case "A": return 4;
		case "S": return 5;
		default: return 0;
	}
}

function set_shake(shake, obj = id)
{
	if obj.shake > shake { exit; }
	obj.shake = shake;
}

function part_delay_cleanup(ps)
{
	return instance_create_depth(0, 0, 0, objParticleCleanup, { ps: ps });
}