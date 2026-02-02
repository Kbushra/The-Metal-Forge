#macro GAME_WIDTH 320
#macro GAME_HEIGHT 256

#macro HORIZONTAL 0
#macro VERTICAL 1
#macro NONE -1

#macro RAND_WANDER irandom_range(120, 180)

#macro print show_debug_message

enum playerStates
{
	normal,
	freeze
}

enum carrierValue
{
	signal,
	package
}

enum carrierTarget
{
	instance,
	place
}

enum pathfinderStates
{
	wander,
	pathfind
}