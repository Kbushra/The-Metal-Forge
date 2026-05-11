global.sfxEmitter = audio_emitter_create();
global.sfxBus = audio_bus_create();
audio_emitter_bus(global.sfxEmitter, global.sfxBus);

global.bgmEmitter = audio_emitter_create();
global.bgmBus = audio_bus_create();
audio_emitter_bus(global.bgmEmitter, global.bgmBus);

global.bgm = noone;

startedRoom = true;