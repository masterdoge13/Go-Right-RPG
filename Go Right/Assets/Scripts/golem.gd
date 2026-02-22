extends CharacterBody2D
@export var HEALTH: int = 500
@export var MAXHEALTH: float = 500
@export var SPEED = 1200
@export var DAMAGE = 200
@export var STAY_DISTANCE = 2000
var attack_scene = preload("res://Assets/Enemies/golem_beam.tscn")
var direction: Vector2 = Vector2.DOWN
var distance
var aggro_bool = false
var move_bool = true
var laser_bool = false
var target

func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	HEALTH -= damage

func _process(_delta):
	if HEALTH == 0:
		queue_free()
	if aggro_bool:
			
		if move_bool:
			distance = global_position.distance_to(target.global_position)
			if distance >= STAY_DISTANCE:
				direction = (target.global_position - global_position).normalized()
			else:
				direction = -(target.global_position - global_position).normalized()
			velocity = direction * SPEED 
			move_and_slide()


func aggro(body):
	target = body
	if aggro_bool == false:
		$"Laser Cooldown".start(1)
	aggro_bool = true


func _on_laser_cooldown_timeout() -> void:
	$"attack rotation axis/attack spawn/Sprite2D".visible = true
	move_bool = false
	laser_bool = true
	$"Laser Charge".start(0.25 + 0.75*(HEALTH/MAXHEALTH))
	


func _on_laser_charge_timeout() -> void:
	$"attack rotation axis/attack spawn/Sprite2D".visible = false
	var pos = $"attack rotation axis/attack spawn".position
	var attack = attack_scene.instantiate()
	attack.global_position = pos
	attack.damage = DAMAGE
	$"attack rotation axis".add_child(attack)
	$"Cooldown Period".start(1+1*(HEALTH/MAXHEALTH))


func _on_cooldown_period_timeout() -> void:
	print(HEALTH/MAXHEALTH)
	$"Laser Cooldown".start(5*(HEALTH/MAXHEALTH))
	move_bool = true
	laser_bool = false
