move_selection = function()
{
	if global.confirm { selectStage++; }
	if global.deny { selected[1] = 0; selectStage--; }
	selectStage = clamp(selectStage, 0, 1);
	
	if global.upPress { selected[selectStage]--; }
	if global.downPress { selected[selectStage]++; }
	
	var len = selectStage == 0 ? 3 : selectLen[selected[0]];
	selected[selectStage] = (selected[selectStage] + len) % len;
}

manage_audio = function()
{
	if global.right && global.left { rightDelay = 0; leftDelay = 0; return; }
	
	var emitter = selected[1] == 0 ? global.sfxEmitter : global.bgmEmitter;
	var gain = audio_emitter_get_gain(emitter);
	
	if global.right
	{
		if global.rightPress
		{
			audio_emitter_gain(emitter, clamp(gain + 0.05, 0, 1));
			rightDelay = 30;
		}
			
		rightDelay--;
			
		if rightDelay <= 0
		{ audio_emitter_gain(emitter, clamp(gain + 0.01, 0, 1)); }
	}
	else { rightDelay = 0; }
			
	if global.left
	{
		if global.leftPress
		{
			audio_emitter_gain(emitter, clamp(gain - 0.05, 0, 1));
			leftDelay = 30;
		}
			
		leftDelay--;
			
		if leftDelay <= 0
		{ audio_emitter_gain(emitter, clamp(gain - 0.01, 0, 1)); }
	}
	else { leftDelay = 0; }
}