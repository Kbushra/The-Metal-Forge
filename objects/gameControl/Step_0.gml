if keyboard_check_pressed(vk_f4) { window_set_fullscreen(!window_get_fullscreen()); }
global.right = keyboard_check(directionKey.R);
global.left = keyboard_check(directionKey.L);
global.down = keyboard_check(directionKey.D);
global.up = keyboard_check(directionKey.U);
global.run = keyboard_check(vk_shift);