class_name Player extends CharacterBody2D

const SPEED = 7500.0;
const TURN_SPEED = 7.5;

var health = 100.0;
var stamina = 100.0;

func _physics_process(delta):
  var turn = Input.get_axis("left", "right");
  rotate(turn * TURN_SPEED * delta);

  var move = Input.get_axis("down", "up");
  var sprint = Input.get_action_strength("sprint") + 1.0;
  if stamina > 0&&sprint > 1.0:
    stamina -= delta * 10;
  else:
    stamina += delta * 5;
    sprint = 1.0;

  if stamina > 100:
    stamina = 100;
  
  if stamina < 0:
    stamina = 0;

  (get_node("/root/GameScene/GUI") as GUI).set_stamina(stamina);
  
  velocity = Vector2(move * SPEED * delta * sprint, 0).rotated(rotation);

  if Input.is_action_just_pressed("fire"):
    var bullet = Bullet.create(self, Vector2(17, 9));
    get_parent().add_child(bullet);
  
  move_and_slide();

func damage(dmg: float):
  health -= dmg;
  (get_node("/root/GameScene/GUI") as GUI).set_health(health);
