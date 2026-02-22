extends Node2D
var boss_theme_playing = false



func _on_main_theme_finished() -> void:
	if !boss_theme_playing:
		$"Main Theme".play()
