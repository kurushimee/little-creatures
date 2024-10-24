extends Node

@export var minion_scene: PackedScene
@export var current_boss: Area2D

@onready var viewport_size: Vector2i = get_viewport().content_scale_size


func spawn_minion() -> void:
  var instance: Node = minion_scene.instantiate()
  add_child(instance)
  instance.current_boss = current_boss

  # Try to get a random position for the minion
  # until it's outside of the screen
  var pos := get_random_position()
  while ((pos.x >= 0 and pos.x <= viewport_size.x)
    and (pos.y >= 0 and pos.y <= viewport_size.y)):
    pos = get_random_position()
  instance.position = pos


func get_random_position() -> Vector2:
  return Vector2(
    randf_range(-10, viewport_size.x + 10),
    randf_range(-10, viewport_size.y + 10)
  )
