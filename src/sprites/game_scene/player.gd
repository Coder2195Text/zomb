extends CharacterBody2D

const SPEED = 7500.0;
const TURN_SPEED = 7.5;

func _physics_process(delta):
  var turn = Input.get_axis("left", "right");
  rotate(turn * TURN_SPEED * delta);

  var move = Input.get_axis("down", "up");
  var sprint = Input.get_action_strength("sprint") + 1.0;
  velocity = Vector2(move * SPEED * delta * sprint, 0).rotated(rotation);
  
  move_and_slide();
