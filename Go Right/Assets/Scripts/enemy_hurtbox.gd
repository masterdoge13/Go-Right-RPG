extends Area2D
var DAMAGE
var keep_attacking = false
var attack_now = false
var target

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player_hit"):
		attack_now = true
		target = body
		keep_attacking = true
		$"Hit Cooldown".start(1)

func _process(_delta: float) -> void:
	if keep_attacking:
		if attack_now:
			target.player_hit(DAMAGE)
			attack_now = false
			$"Hit Cooldown".start(1)
	

func _on_body_exited(body: Node2D) -> void:
	if body.has_method("player_hit"):
		keep_attacking = false


func _on_hit_cooldown_timeout() -> void:
	attack_now = true
	
