extends Node2D

var direction := Vector2(1.0,0)
var SPEED := 300
var game_over : bool = false
var speed_multiplier := 1

signal gameover_signal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over: 
		return
	if Input.is_action_just_pressed("ui_left"):
		direction = Vector2(-1.0, 0)
	if Input.is_action_just_pressed("ui_right"):
		direction = Vector2(1.0, 0)
	if Input.is_action_just_pressed("ui_up"):
		direction = Vector2(0.0, -1.0)
	if Input.is_action_just_pressed("ui_down"):
		direction = Vector2(0.0, 1.0)
		
	position += direction * SPEED * delta * speed_multiplier


func _on_move_timer_timeout() -> void:
	pass

func stop_movement():
	$MoveTimer.stop()
	direction = Vector2.ZERO
	game_over = true

func _on_left_body_entered(_body: Node2D) -> void:
	gameover_signal.emit()
	stop_movement()
	
func _on_right_body_entered(_body: Node2D) -> void:
	gameover_signal.emit()
	stop_movement()

func _on_bottom_body_entered(_body: Node2D) -> void:
	gameover_signal.emit()
	stop_movement()

func _on_top_body_entered(_body: Node2D) -> void:
	gameover_signal.emit()
	stop_movement()


func _on_main_increase_speed_multiplier(score: Variant) -> void:
	speed_multiplier = score
