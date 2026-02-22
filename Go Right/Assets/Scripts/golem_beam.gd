extends Area2D
var damage
func _ready():
		$lifetime.start(0.3)
		
		


func _on_lifetime_timeout() -> void:
	queue_free()








func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_hit"):
		body.player_hit(damage)
