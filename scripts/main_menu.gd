extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_check_food_music_button_toggled(toggled_on: bool) -> void:
	pass


func _on_check_music_button_toggled(toggled_on: bool) -> void:
	Global.set_play_music(toggled_on)
	print("toggled!")
