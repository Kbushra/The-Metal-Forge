function json_write()
{
	var save = file_text_open_write("metalforge.json");
	
	file_text_write_string(save,
		json_stringify({
			sfxVolume: audio_emitter_get_gain(global.sfxEmitter),
			bgmVolume: audio_emitter_get_gain(global.bgmEmitter),
			levelsUnlocked: global.levelsUnlocked
		})
	);
	
	file_text_close(save);
}

function json_read()
{
	var struct = {};
	if file_exists("metalforge.json")
	{
		var save = undefined;
		
		try
		{
			save = file_text_open_read("metalforge.json");
			struct = json_parse(file_text_read_string(save));
			file_text_close(save);
		}
		catch(err)
		{
			if save { file_text_close(save); }
			assert(false, "Corrupt save file!", true);
		}
	}
	
	audio_emitter_gain(global.sfxEmitter, struct[$ "sfxVolume"] ?? 1);
	audio_emitter_gain(global.bgmEmitter, struct[$ "bgmVolume"] ?? 1);
	global.levelsUnlocked = struct[$ "levelsUnlocked"] ?? 2;
}