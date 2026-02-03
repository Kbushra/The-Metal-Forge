gamePathfinder.log = !gamePathfinder.log;
with (parentMetalAI) { state = gamePathfinder.log ? pathfinderStates.pathfind : pathfinderStates.wander; }