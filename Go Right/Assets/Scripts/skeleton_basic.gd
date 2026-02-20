extends CharacterBody2D
@export var HEALTH = 30
@export var SPEED = 1000
@export var DAMAGE = 20
var direction: Vector2 = Vector2.DOWN
var aggro_bool = false
var target

func _process(_delta):
	if HEALTH == 0:
		queue_free()
	if aggro_bool:
		direction = (target.global_position - global_position).normalized()
		velocity = direction * SPEED 
		move_and_slide()
	
func _ready() -> void:
	$EnemyHurtbox.DAMAGE = self.DAMAGE


func aggro(body):
	target = body
	aggro_bool = true


func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	HEALTH -= damage
