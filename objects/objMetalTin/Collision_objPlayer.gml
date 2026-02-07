if state == pathfinderStates.puppet { exit; }

var xTarg = pathfinderStates.wander ? xstart : next[0];
var yTarg = pathfinderStates.wander ? ystart : next[1];

if !near_equals(xTarg, x, 2) || !near_equals(yTarg, y, 2)
{ other.knock(xTarg - x, yTarg - y, 32, 5); }
else { other.knock(0, 1, 32, 5); }