extends Area2D
var damage
func _ready():
		$lifetime.start(0.1)
		
		


func _on_lifetime_timeout() -> void:
	queue_free()





func _on_area_entered(area: Area2D) -> void:
	if area.has_method("hit"):
		area.hit(damage)


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("aggro"):
		body.aggro(get_parent())
