if !assert(instance_number(trigSpawn) == 1, "Invalid spawn!") { exit; }

send_signal(gameCamera, "snap", true);
x = trigSpawn.x;
y = trigSpawn.y;
stillDirection = trigSpawn.dir;
//faceDirection = stillDirection;
	
stop_signal("spawn");