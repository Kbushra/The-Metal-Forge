hp = 100;
maxHp = 100;
highlight = 1;

shownHp = hp;

deathAnim = false;

///@func deal_damage(dmg)
deal_damage = function(dmg)
{
	if objPlayer.state == playerStates.puppet { return; }
	hp -= dmg;
}