extends Node2D

var body_scene : PackedScene = load("res://scenes/body.tscn")
var snake_cells : Array[Vector2i] = [] 
var snake_bodies : Array[Node2D] = [] 

var GRID := 64
var SPEED := 300
var STEP_TIME := 0.15

var direction := Vector2i.RIGHT
var next_direction := Vector2i.RIGHT
var game_over : bool = false
var speed_multiplier := 1

signal gameover_signal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = to_px(to_cell(position))
	snake_cells = [to_cell(position)]
	_speed_change()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if game_over: 
		return
	if Input.is_action_just_pressed("ui_left") && direction != Vector2i.RIGHT:
		next_direction = Vector2i.LEFT
	if Input.is_action_just_pressed("ui_right") && direction != Vector2i.LEFT:
		next_direction = Vector2i.RIGHT
	if Input.is_action_just_pressed("ui_up")  && direction != Vector2i.DOWN:
		next_direction = Vector2i.UP
	if Input.is_action_just_pressed("ui_down")  && direction != Vector2i.UP:
		next_direction = Vector2i.DOWN

func _on_move_timer_timeout() -> void:
	if game_over: return
	
	direction = next_direction
	position += Vector2(direction.x * GRID, direction.y *GRID) 
	var new_head := snake_cells[0] + direction
	
	# Check for collision with body
	if snake_cells.size() > 1 && snake_cells.find(new_head, 1) != -1: 
		gameover_signal.emit(); 
		stop_movement()
		return
	
	snake_cells.insert(0,new_head)
	snake_cells.pop_back()
	
	# Move each snake body
	for b in range(snake_bodies.size()):
		snake_bodies[b].position = to_px(snake_cells[b+1])
	

func stop_movement():
	$MoveTimer.stop()
	direction = Vector2.ZERO
	game_over = true

func _on_any_wall_body_entered(_body: Node2D) -> void:
	gameover_signal.emit()
	stop_movement()

func _on_main_increase_speed_multiplier(score: Variant) -> void:
	speed_multiplier = score
	call_deferred("grow",1)
	
func grow(by: int = 1) -> void: 
	for _i in by:
		var tail_cell = snake_cells.back()
		var body := body_scene.instantiate()
		$Bodies.add_child(body)
		snake_bodies.append(body)
		snake_cells.append(tail_cell)
		body.position = to_px(tail_cell)
	
func to_px(c : Vector2i) -> Vector2:
	return Vector2(c.x * GRID, c.y * GRID)

func to_cell(p: Vector2) -> Vector2i:
	return Vector2i(round(p.x / GRID), round(p.y / GRID))
	
func _speed_change() -> void:
	$MoveTimer.wait_time = STEP_TIME
	$MoveTimer.start()
	
