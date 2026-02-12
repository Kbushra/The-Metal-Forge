event_inherited();
maxHp = 150;
hp = maxHp;
deathAnim = false;
collapseTimer = 0;

///@func deal_damage(dmg)
deal_damage = function(dmg)
{
	if objPlayer.state == playerStates.puppet { return; }
	hp -= dmg * power(0.7, instance_number(objBuildingPedestal));
}