class_name GUI extends CanvasLayer

func set_health(health: float):
  $Control/Health.value = health;

func set_stamina(stamina: float):
  $Control/Stamina.value = stamina;