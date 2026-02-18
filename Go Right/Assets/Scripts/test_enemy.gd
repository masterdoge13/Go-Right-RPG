extends Node2D
@export var HEALTH = 10


func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	HEALTH -= damage
	print("take damage, hp is "+str(HEALTH))
