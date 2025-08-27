extends CanvasLayer

@onready var restart: Button = %Restart
@onready var main_menu: Button = %"Main Menu"
@onready var message: Label = $VBoxContainer/Message


func update_score(score):
	$Score.text = str(score)


func show_message(text):
	message.text = text
	message.show()
	
func show_game_over():
	restart.show()
	main_menu.show()
	show_message("Game Over")
	
func _reset() -> void:
	update_score(0)
	message.text = ""
	message.hide()
	restart.hide()
	main_menu.hide()

func _on_button_pressed() -> void:
	_reset()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_main_menu_pressed() -> void:
	_reset()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
