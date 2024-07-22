extends Node2D;

const Grass = preload ("res://sprites/game_scene/grass.tscn");
const ZombieScene = preload ("res://sprites/game_scene/zombie.tscn");

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
