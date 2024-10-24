extends Node

class_name Health

@export var max: float = 100.0
var current: float

var dead: bool

signal healed(amount: float)
signal damaged(amount: float)
signal died


func _ready() -> void:
  current = max
  damaged.connect(get_viewport().get_camera_2d().apply_shake)


func damage(amount: float) -> void:
  if dead: return
  assert(amount >= 0, "Damage amount can't be negative.")

  # Decrease current health by `amount`.
  current -= amount
  damaged.emit(amount)
  $HurtSound.pitch_scale = 1.33 - (amount / max)
  $HurtSound.play()

  # Emit a `died` signal on entity's death (current health reaching 0).
  if current <= 0:
    dead = true
    died.emit()


func heal(amount: float) -> void:
  if dead: return
  assert(amount >= 0, "Heal amount can't be negative.")
  # Increase current health by `amount`.
  current += amount
  healed.emit(amount)
