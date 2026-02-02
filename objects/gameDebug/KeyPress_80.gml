gamePathfinder.log = !gamePathfinder.log;
with (parentPathfinderAI) { state = gamePathfinder.log ? pathfinderStates.pathfind : pathfinderStates.wander; }