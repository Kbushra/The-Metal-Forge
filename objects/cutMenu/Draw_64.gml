var controls = @"Controls:
Arrows/WASD to move
" + (os_browser == browser_not_a_browser ? "F4" : "F10") + @" to fullscreen

Z/ENTER to confirm
X/SHIFT to deny or run

C/CTRL to show construction
Q/E to move construction select
";

if step == 3
{
	draw_set_alpha(titleEase);
	draw_sprite(sprTitle, 0,
		room_width/2, exponential_out(10, 20, titleEase, 2));
	
	draw_set_alpha(1);
}

if step == 4
{
	draw_set_alpha(0.9);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, exponential_out(0, room_width, titleEase, 4), room_height, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	
	draw_sprite(sprTitle, 0,
		exponential_out(room_width/2, sprite_get_xoffset(sprTitle) + 10, titleEase, 4), 20);
	
	draw_set_alpha(titleEase);
	
	draw_list(20, 120, 12, selected[0],
	"Play",
	"Audio",
	"Quit"
	);
	
	if selected[0] == 0
	{
		if selectStage == 0 { draw_text(80, 120, controls); }
		else
		{
			var levels = [];
			for (var i = 0; i < global.levelsUnlocked; i++) { array_push(levels, global.level[i].name); }
		
			script_execute_ext(draw_list, array_concat([80, 120, 12, selected[1]], levels));
		}
	}
	
	if selected[0] == 1
	{
		draw_list(80, 120, 12, selectStage == 0 ? -1 : selected[1],
		$"SFX volume: {audio_emitter_get_gain(global.sfxEmitter)}",
		$"BGM volume: {audio_emitter_get_gain(global.bgmEmitter)}"
		);
	}
	
	if selected[0] == 2 { draw_text(80, 120, "Your game will be saved."); }
	
	draw_reset();
}