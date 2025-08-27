extends CanvasLayer

func update_score(score):
	$Score.text = str(score)


func show_message(text):
	$Message.text = text
	$Message.show()
	
func show_game_over():
	$Button.show()
	show_message("Game Over")
	


func _on_button_pressed() -> void:
	update_score(0)
	$Message.text = ""
	$Message.hide()
	$Button.hide()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
