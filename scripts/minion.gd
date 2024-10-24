extends Area2D

@export var explosion: PackedScene
@export var current_boss: Area2D
@export var speed: float

var damage := 1.0


func _process(delta: float) -> void:
  look_at(current_boss.position)
  position += (current_boss.position - position).normalized() * speed * delta


func _on_boss_hit(area: Area2D) -> void:
  # Hurt the boss.
  area.get_node("Health").damage(damage)

  # Create an explosion effect.
  var instance := explosion.instantiate()
  instance.position = global_position
  instance.rotation = global_rotation
  instance.emitting = true
  get_tree().current_scene.add_child(instance)

  queue_free()
