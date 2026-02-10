visible = room != rmMenu;
if !visible { hp = maxHp; shownHp = hp; highlight = 1; }

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

hp = clamp(hp, 0, maxHp);
shownHp = clamp(shownHp, 0, maxHp);
highlight = clamp(highlight, 0, 1);