extends Area2D

@export var rotate_speed := 50.0
const ROTATION_MULTIPLIER := 10000.0

@onready var health: Health = $Health


func _ready() -> void:
  var ui: Control = get_node("../UI")
  ui.health = health
  health.damaged.connect(ui.boss_health_changed)
  health.healed.connect(ui.boss_health_changed)


func _process(delta: float) -> void:
  # Constantly rotate the boss at a consistent speed.
  rotate(rotate_speed / ROTATION_MULTIPLIER)
