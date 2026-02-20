extends CharacterBody2D
var attack_scene = preload("res://Assets/Player/Attack.tscn")
@export var SPEED = 2000
@export var DAMAGE = 5
@export var HEALTH = 500
@export var MAXHEALTH = 500
var can_dash = true
var can_attack = true

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up","down")
	velocity = direction*SPEED
	move_and_slide()
	if can_dash:
		if Input.is_action_pressed("dash") and can_dash == true:
			can_dash = false
			velocity = (get_global_mouse_position()-global_position).normalized()*SPEED*50
			move_and_slide()
			$"dash cooldown".start(1)
			
	if Input.is_action_pressed("fire") and can_attack == true:
		can_attack = false
		$"attack cooldown".start(0.2)
		var pos = $"attack/attack spawn point".position
		var attack = attack_scene.instantiate()
		attack.global_position = pos
		attack.damage = DAMAGE
		$attack.add_child(attack)


func _on_dash_timer_timeout() -> void:
	can_dash = true


func _on_attack_cooldown_timeout() -> void:
	can_attack = true
	
func  player_hit(damage):
	HEALTH -= damage
	print(HEALTH)
	$"health regen cooldown".start(10)
	

func _on_health_regen_cooldown_timeout() -> void:
	HEALTH += 50
	print("HEALTH healed")
	
	if HEALTH >= MAXHEALTH:
		HEALTH = MAXHEALTH
		print(HEALTH)
	else:
		$"health regen cooldown".start(10)
		print(HEALTH)
	
