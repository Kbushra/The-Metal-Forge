if other.state == playerStates.puppet { exit; }

play_sfx(sfxPickup);
global.resourceCount[ind]++;
instance_destroy();