extends AudioStreamPlayer2D

func _ready() -> void:
	playing = Global.play_music
	Global.play_music_changed.connect(func(v): playing = v)
