randomise();
draw_set_font(fntMain);

global.sfxEmitter = audio_emitter_create();
global.sfxBus = audio_bus_create();
audio_emitter_bus(global.sfxEmitter, global.sfxBus);

global.bgmEmitter = audio_emitter_create();
global.bgmBus = audio_bus_create();
audio_emitter_bus(global.bgmEmitter, global.bgmBus);

event_user(0);

instance_create_depth(x, y, depth, gameControl);
instance_create_depth(x, y, depth, objPlayer);

instance_create_depth(x, y, depth, gameCamera);
instance_create_depth(x, y, depth, gamePathfinder);

//Create only on debug builds
instance_create_depth(x, y, depth, gameDebug);