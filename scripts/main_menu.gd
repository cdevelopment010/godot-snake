extends Control

func _ready() -> void:
	$MenuItemContainer/CheckFoodMusicButton.button_pressed = Global.play_sfx
	$MenuItemContainer/CheckMusicButton.button_pressed = Global.play_music

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_check_food_music_button_toggled(toggled_on: bool) -> void:
	Global.set_play_sfx(toggled_on)
	$SelectSound.play()


func _on_check_music_button_toggled(toggled_on: bool) -> void:
	Global.set_play_music(toggled_on)
	$SelectSound.play()
