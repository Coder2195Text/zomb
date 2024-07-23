extends Node2D;

const Grass = preload ("res://sprites/game_scene/grass.tscn");
const ZombieScene = preload ("res://sprites/game_scene/zombie.tscn");

var last_pos = Vector2(0, 0);

func _ready():
  for x in range( - 12, 12):
    for y in range( - 8, 8):
      var grass = Grass.instantiate();
      grass.player_offset = Vector2(x, y);
      add_child(grass);

  for x in range( - 12, 12):
    var zombie = ZombieScene.instantiate();
    zombie.position = Vector2(x * 128, -200);
    add_child(zombie);

  for i in range(0, 50):
    var body = $StaticBody2D.duplicate();
    body.position = Vector2(randf_range( - 2000, 2000), randf_range( - 2000, 2000));
    add_child(body);

  regen_nav_map();

func regen_nav_map():
  var map: NavigationRegion2D = $NavRegion;
  var pos = $Player.position;
  var polygon = map.navigation_polygon;
  polygon.clear();
  polygon.add_outline([pos + Vector2( - 3000, -3000), pos + Vector2(3000, -3000), pos + Vector2(3000, 3000), pos + Vector2( - 3000, 3000)]);

  map.navigation_polygon = polygon;

  map.bake_navigation_polygon();

func _process(_delta):
  var pos = $Player.position;

  if (pos.distance_to(last_pos) > 500):
    regen_nav_map();
    last_pos = pos;
