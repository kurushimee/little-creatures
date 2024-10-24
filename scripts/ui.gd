extends Control

@onready var boss_bar: ColorRect = $BossHealth
@onready var initial_size := boss_bar.size.x

@onready var health_hud: Label = $HealthHUD

var health: Health


func boss_health_changed(amount: float) -> void:
  boss_bar.size.x = initial_size * (health.current / health.max)
  health_hud.text = str(int(health.current))
