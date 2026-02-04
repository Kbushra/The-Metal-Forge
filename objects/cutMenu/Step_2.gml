send_signal(objPlayer, "puppet", true);

if step == 0
{
	objPlayer.x += 2;
	objPlayer.sprite_index = sprPlayerRR;
	objPlayer.image_speed = 1;
	
	if objPlayer.x >= 100 && !instance_exists(objVolt)
	{ instance_create_depth(-32, 208, 0, objVolt, { origin: id }); }
	
	if got_signal("electrocuted") { step++; }
}

if step == 1
{
	objPlayer.image_angle -= 2;
	objPlayer.y += ySpd;
	ySpd += 0.1;
	
	if objPlayer.y > room_height + 200 { step++; time = 120; }
}

if step == 2
{
	if !done_action("spawn_metal")
	{
		for (var i = 0; i < 20; i++)
		{
			instance_create_depth(-32, irandom_range(112, 208), 0,
				choose(objMetalTin, objMetalConveyor, objMetalGrill));
		}
		
		with (objMetalGrill) { targX = irandom_range(32, 64); }
	}
	
	time--;
	if time <= 0 { step++; time = 120; }
}

if step == 3
{
	titleEase += 0.02;
	
	time--;
	if time <= 0 { step++; titleEase = 0; }
}

if step < 4 { exit; }

gameCamera.shake = 0;
titleEase += 0.02;
	
move_selection();
if selected[0] == 0 && selectStage == 1 { room_goto_spawn(rmMain); }
if selected[0] == 1 && selectStage == 1 { manage_audio(); }