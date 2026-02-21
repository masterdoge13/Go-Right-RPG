extends CharacterBody2D
var target
var aggro_bool = false
var SPEED = 0
var direction
func aggro(body):
	if (aggro_bool == false):
		target = body
		aggro_bool = true

func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	direction = (global_position - target.global_position).normalized()
	SPEED = 2000
	

func _process(delta: float) -> void:
	if SPEED > 0:
		velocity = direction * SPEED
		move_and_slide()
		SPEED -= 2000*delta
		if SPEED < 0:
			SPEED = 0
	
