extends CharacterBody2D
var attack_scene = preload("res://Assets/Player/Attack.tscn")
@export var SPEED = 200
@export var DAMAGE = 5
@export var HEALTH = 500
var can_dash = true
var can_attack = true

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up","down")
	velocity = direction*SPEED
	move_and_slide()
	if can_dash:
		if Input.is_action_pressed("dash") and can_dash == true:
			can_dash = false
			velocity = (get_global_mouse_position()-global_position).normalized()*SPEED*100
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
	
func  player_get_hit(damage):
	HEALTH -= damage
