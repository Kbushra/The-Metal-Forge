send_signal(objPlayer, "puppet", true);

if step == 0
{
	with objPlayer
	{
		sprite_index = sprPlayerRR;
		image_speed = 1;
		image_blend = c_white;
		image_xscale = 1;
		image_yscale = 1;
		faceDirection = "R";
		stillDirection = "R";
	
		moving = window_has_focus() || instance_exists(objVolt);
		if moving { x += 2; }
	}
	
	if objPlayer.x >= 100 && !instance_exists(objVolt)
	{
		instance_create_depth(-32, 208, 0, objVolt, { origin: id, ignorePuppeting: true });
		play_sfx(sfxVoltCreate);
	}
	
	if got_signal("electrocuted") { objPlayer.moving = false; step++; }
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
		play_sfx(sfxSmoke);
		
		for (var i = 0; i < 20; i++)
		{
			instance_create_depth(-32, irandom_range(112, 208), 0,
				global.enemy[irandom(array_length(global.enemy) - 1)].obj);
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
	if time <= 0
	{
		step++;
		titleEase = 0;
		
		var effect = audio_effect_create(AudioEffectType.Gain);
		global.sfxBus.effects[0] = effect;
	}
}

if step < 4 { exit; }

gameCamera.shake = 0;
titleEase += 0.02;

if !instance_exists(cutTransition)
{ global.sfxBus.effects[0].gain = lerp(global.sfxBus.effects[0].gain, 0.3, 0.1); }
else { global.sfxBus.effects[0] = undefined; }

if instance_exists(cutTransition) { exit; }

if selected[0] == 0 && selectStage == 1 && global.confirm
{
	json_write();
	global.currLevel = selected[1];
	room_transition(global.currLevel == 0 ? rmTutorial : asset_get_index($"rmLevel{global.currLevel}"));
}

if selected[0] == 1 && selectStage == 1 { manage_audio(); }
if selected[0] == 2 && global.confirm { json_write(); game_end(); exit; }

move_selection();