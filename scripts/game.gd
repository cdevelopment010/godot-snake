extends Node2D
@export var food_scene : PackedScene

var score := 0

signal increase_speed_multiplier(score)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func game_over(): 
	print("GAME OVER")
#func _on_food_timer_timeout() -> void:
	#var food = food_scene.instantiate()
	#food.position = Vector2(randf() * get_viewport_rect().size.x, randf() * get_viewport_rect().size.y)
	#$Food.add_child(food)




func _on_snake_gameover_signal() -> void:
	game_over()
	$HUD.show_game_over()


func _on_food_food_signal() -> void:
	score += 1
	$HUD.update_score(score)
	increase_speed_multiplier.emit(score)
