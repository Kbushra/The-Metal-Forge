if !assert(instance_number(trigSpawn) == 1, "Invalid spawn!") { exit; }

send_signal(gameCamera, "snap", true);
x = trigSpawn.x;
y = trigSpawn.y;
	
stop_signal("spawn");