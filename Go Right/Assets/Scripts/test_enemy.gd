extends Node2D
@export var health = 10


func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	health -= damage
	print("take damage, hp is "+str(health))
