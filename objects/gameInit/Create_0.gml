randomise();
draw_set_font(fntMain);

instance_create_depth(x, y, depth, gameControl);
instance_create_depth(x, y, depth, objPlayer);
instance_create_depth(x, y, depth, gameCamera);
instance_create_depth(x, y, depth, gamePathfinder);

//Create only on debug builds
instance_create_depth(x, y, depth, gameDebug);