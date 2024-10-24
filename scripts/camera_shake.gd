extends Camera2D

# Multiplier for lerping the shake strength to zero.
@export var shake_decay_rate := 5.0
@export var min_shake_strength := 1.0

@onready var rand := RandomNumberGenerator.new()
@onready var viewport_size: Vector2i = get_viewport().content_scale_size

var shake_strength := 0.0


func _ready() -> void:
  rand.randomize()


func _process(delta: float) -> void:
  # Fade out the intensity over time.
  shake_strength = lerp(shake_strength, 0.0, shake_decay_rate * delta)

  # Shake by adjusting camera offset so we can move the camera around
  # via its position property
  offset = get_random_offset()


func apply_shake(amount: float) -> void:
  assert(amount >= 0, "Shake strength can't be negative.")
  # Limit the minimum shake strength so that it stays noticeable
  shake_strength = clampf(amount, min_shake_strength, INF)


func get_random_offset() -> Vector2:
  # Limit the X and Y offset to half the viewport size, so that the shaking
  # doesn't exceed the background sprite
  var half_viewport = viewport_size / 2
  var offset_x := clampf(
    rand.randf_range(-shake_strength, shake_strength),
    -half_viewport.x,
    half_viewport.x
  )
  var offset_y := clampf(
    rand.randf_range(-shake_strength, shake_strength),
    -half_viewport.y,
    half_viewport.y
  )
  return Vector2(offset_x, offset_y)
