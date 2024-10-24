extends Node2D

@export var scroll_speed: float
var bg_width: int


func _ready() -> void:
  bg_width = $Sprite2D.texture.get_width()


func _process(delta: float) -> void:
  position.x -= scroll_speed * delta
  if position.x <= -bg_width:
    position.x = 0
