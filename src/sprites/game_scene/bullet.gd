class_name Bullet extends CharacterBody2D;

static var BulletScene = preload ("res://sprites/game_scene/bullet.tscn");

var creator = null;

static func create(node: Node2D, offset=Vector2(0, 0)):
  var this = BulletScene.instantiate();
  if this is Bullet:
    this.creator = node;
  
  this.position = node.position + offset.rotated(node.rotation);
  this.rotation = node.rotation;
  return this;

# Called when the node enters the BulletScene tree for the first time.
func _ready():
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass

func _physics_process(delta):
  # Move the bullet in direction
  velocity = Vector2(1, 0).rotated(rotation) * 1000;

  move_and_slide();

func body_enter(body: Node2D):
  if is_queued_for_deletion():
    return ;
  if body is StaticBody2D:
    queue_free();
  elif body is Zombie:
    body.queue_free();
    queue_free();
