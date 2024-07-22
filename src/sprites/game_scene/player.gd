class_name Player extends CharacterBody2D

const SPEED = 7500.0;
const TURN_SPEED = 7.5;

var health = 100.0;

func _physics_process(delta):
  var turn = Input.get_axis("left", "right");
  rotate(turn * TURN_SPEED * delta);

  var move = Input.get_axis("down", "up");
  var sprint = Input.get_action_strength("sprint") + 1.0;
  velocity = Vector2(move * SPEED * delta * sprint, 0).rotated(rotation);

  if Input.is_action_just_pressed("fire"):
    var bullet = Bullet.create(self, Vector2(17, 9));
    get_parent().add_child(bullet);

  $Health.global_position = self.global_position + Vector2( - $Health.size.x / 2, -50);
  $Health.rotation = -rotation;
  
  move_and_slide();

func damage(dmg: float):
  health -= dmg;
  $Health.value = health;