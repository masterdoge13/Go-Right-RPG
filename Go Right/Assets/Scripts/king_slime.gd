extends CharacterBody2D
@export var HEALTH = 300
@export var SPEED = 5000
@export var DAMAGE = 30
var direction: Vector2 = Vector2.DOWN
var jump = false
var target

func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	HEALTH -= damage


func _process(_delta):
	if HEALTH == 0:
		queue_free()
	if jump:
		direction = (target.global_position - global_position).normalized()
		velocity = round(direction * SPEED * randf_range(0.8, 1.2))
		move_and_slide()
	
func _ready() -> void:
	$EnemyHurtbox.DAMAGE = self.DAMAGE

func _on_jump_timer_timeout() -> void:
	jump = true
	$"air time".start(0.1)
	$"jump timer".start(randf_range(0.5,1))


func _on_air_time_timeout() -> void:
	jump = false
	
func aggro(body):
	target = body
	$"jump timer".start(randf_range(0.5,1))
