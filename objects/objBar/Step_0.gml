if shownHp < hp
{
	shownHp = lerp(shownHp, hp, 0.1);
	highlight = lerp(highlight, hp/maxHp, 0.4);
}

if highlight > hp/maxHp
{
	highlight = lerp(highlight, hp/maxHp, 0.1);
	shownHp = lerp(shownHp, hp, 0.4);
}