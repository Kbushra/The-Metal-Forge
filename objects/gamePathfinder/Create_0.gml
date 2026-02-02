print("pathfinder created");

image_alpha = 0;

tileSize = 20;
sourceX = 0;
sourceY = 0;
sourceTileX = floor(sourceX / tileSize);
sourceTileY = floor(sourceY / tileSize);

interval = 15;
maxDistance = ceil((GAME_WIDTH/tileSize) / 2) + 5; //Only calculates tiles from that far away

maxWeight = 1;
log = false;

event_user(0);
reset_nodes();