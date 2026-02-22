extends Node2D
var boss_theme_playing = false
var boss_defeated = false



func _on_main_theme_finished() -> void:
	if !boss_theme_playing:
		$"Main Theme".play()


func _on_golem_area_body_entered(body: Node2D) -> void:
	if body.has_method("player_hit") && !boss_defeated && !boss_theme_playing:
		boss_theme_playing = true
		$"Main Theme".stop()
		$"Golem Theme".play()


func _on_golem_deafeated() -> void:
	boss_defeated = true
	$"Golem Theme".stop()
	$"Main Theme".play()
	get_tree().change_scene_to_file("res://Levels/victory_screen.tscn")
	


func _on_player_gameover() -> void:
	get_tree().change_scene_to_file("res://Levels/GameOver.tscn")
