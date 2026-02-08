if keyboard_check_pressed(vk_f4) { window_set_fullscreen(!window_get_fullscreen()); }
global.right = keyboard_check(directionKey.R) || keyboard_check(directionKey.RAlt);
global.left = keyboard_check(directionKey.L) || keyboard_check(directionKey.LAlt);
global.down = keyboard_check(directionKey.D) || keyboard_check(directionKey.DAlt);
global.up = keyboard_check(directionKey.U) || keyboard_check(directionKey.UAlt);

global.rightPress = keyboard_check_pressed(directionKey.R) || keyboard_check_pressed(directionKey.RAlt);
global.leftPress = keyboard_check_pressed(directionKey.L) || keyboard_check_pressed(directionKey.LAlt);
global.downPress = keyboard_check_pressed(directionKey.D) || keyboard_check_pressed(directionKey.DAlt);
global.upPress = keyboard_check_pressed(directionKey.U) || keyboard_check_pressed(directionKey.UAlt);

global.confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
global.confirmHeld = keyboard_check(vk_enter) || keyboard_check(ord("Z"));
global.deny = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"));
global.denyHeld = keyboard_check(vk_shift) || keyboard_check(ord("X"));
global.denyRelease = keyboard_check_released(vk_shift) || keyboard_check_released(ord("X"));

global.construct = keyboard_check_pressed(vk_control) || keyboard_check_pressed(ord("C"));
global.constructLeft = keyboard_check_pressed(ord("Q"));
global.constructRight = keyboard_check_pressed(ord("E"));