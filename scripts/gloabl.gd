extends Node

signal play_music_changed(enabled: bool)
signal play_sfx_changed(enabled: bool)

var play_music : bool = true
var play_sfx : bool = true

func set_play_music(v: bool) -> void:
	if play_music == v: return
	play_music = v
	play_music_changed.emit(v)

func set_play_sfx(v: bool) -> void:
	if play_sfx == v: return
	play_sfx = v
	play_sfx_changed.emit(v)
