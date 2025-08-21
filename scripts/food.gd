extends Node2D

signal food_signal

var RNG := RandomNumberGenerator.new()
var SCREEN_SIZE := Vector2.ZERO

func _ready() -> void:
	SCREEN_SIZE = get_viewport_rect().size - Vector2(50.0,50.0)
	position = Vector2(RNG.randf_range(0,SCREEN_SIZE.x),RNG.randf_range(0, SCREEN_SIZE.y))

func _on_area_2d_body_entered(_body: Node2D) -> void:
	food_signal.emit()
	position = Vector2(RNG.randf_range(0,SCREEN_SIZE.x),RNG.randf_range(0, SCREEN_SIZE.y))
