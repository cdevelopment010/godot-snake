extends Node2D

signal food_signal

var RNG := RandomNumberGenerator.new()
var SCREEN_SIZE := Vector2.ZERO
var grid_size := 64

func _ready() -> void:
	SCREEN_SIZE = get_viewport_rect().size / grid_size
	randomize_food_position()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	food_signal.emit()
	if Global.play_sfx:
		$FoodSound.play()
	randomize_food_position()

func randomize_food_position() -> void:
	var grid_x = RNG.randi_range(0, int(SCREEN_SIZE.x) - 1)
	var grid_y = RNG.randi_range(0, int(SCREEN_SIZE.y) - 1)
	position = Vector2(grid_x * grid_size, grid_y * grid_size)
