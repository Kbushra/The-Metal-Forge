randomise();
draw_set_font(fntMain);

event_user(0);
event_user(1);
for (var i = 0; i < resourceNames.length; i++) { global.resourceCount[i] = 0; }

instance_create_depth(x, y, depth, gameAudio);

json_read();

if global.completed && global.levelsUnlocked < array_length(global.level)
{
	global.levelsUnlocked++;
	global.completed = false;
	json_write();
}

instance_create_depth(x, y, depth, gameControl);
instance_create_depth(x, y, depth, objPlayer);

instance_create_depth(x, y, depth, gameCamera);
instance_create_depth(x, y, depth, gamePathfinder);

//Create only on debug builds
//instance_create_depth(x, y, depth, gameDebug);