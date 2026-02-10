function json_write()
{
	var saveData = json_stringify({
		sfxVolume: audio_emitter_get_gain(global.sfxEmitter),
		bgmVolume: audio_emitter_get_gain(global.bgmEmitter),
		levelsUnlocked: global.levelsUnlocked,
		levelRanks: global.levelRanks,
		levelScores: global.levelScores,
		completed: global.completed
	}, true);
	
	var save = buffer_create(string_byte_length(saveData) + 1, buffer_fixed, 1);
	buffer_write(save, buffer_string, saveData);
	buffer_save(save, "metalforge.json");
	buffer_delete(save); save = -1;
}

function json_read()
{
	var struct = {};
	if file_exists("metalforge.json")
	{
		var save = undefined;
		
		try
		{
			save = buffer_load("metalforge.json");
			struct = json_parse(buffer_read(save, buffer_string));
			buffer_delete(save); save = -1;
		}
		catch(err)
		{
			if save { buffer_delete(save); save = -1; }
			assert(false, "Corrupt save file!", true);
		}
	}
	
	audio_emitter_gain(global.sfxEmitter, clamp(struct[$ "sfxVolume"] ?? 1, 0, 1));
	audio_emitter_gain(global.bgmEmitter, clamp(struct[$ "bgmVolume"] ?? 1, 0, 1));
	global.levelsUnlocked = clamp(struct[$ "levelsUnlocked"] ?? 2, 0, array_length(global.level));
	global.levelRanks = struct[$ "levelRanks"] ?? [];
	global.levelScores = struct[$ "levelScores"] ?? [];
	global.completed = struct[$ "completed"] ?? false;
	
	for (var i = 0; i < array_length(global.level); i++)
	{
		if array_length(global.levelRanks) <= i { array_push(global.levelRanks, ""); }
		if array_length(global.levelScores) <= i { array_push(global.levelScores, 0); }
	}
}