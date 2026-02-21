extends CharacterBody2D
@export var HEALTH = 300
@export var SPEED = 500
@export var DAMAGE = 30
var skele_scene = preload("res://Assets/Enemies/skeleton_basic.tscn")
var direction: Vector2 = Vector2.DOWN
var distance
var aggro_bool = false
var target

func _on_enemy_hitbox_take_damage(damage: Variant) -> void:
	HEALTH -= damage

func _process(_delta):
	if HEALTH == 0:
		queue_free()
	if aggro_bool:
		distance = global_position.distance_to(target.global_position)
		if distance >= 1000:
			direction = (target.global_position - global_position).normalized()
		else:
			direction = -(target.global_position - global_position).normalized()
		velocity = direction * SPEED 
		move_and_slide()


func _ready() -> void:
	$EnemyHurtbox.DAMAGE = self.DAMAGE


func aggro(body):
	target = body
	if (aggro_bool == false):
		$"Skeleton Spawn Timer".start(1)
	aggro_bool = true


func _on_skeleton_spawn_timer_timeout() -> void:
	$"Skeleton Spawn Timer".start(5)
	for i in range(0, randi_range(2,4)):
		var skeleton = skele_scene.instantiate()
		skeleton.global_position = global_position+(Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()*100)
		skeleton.aggro(target)
		get_parent().add_child(skeleton)
	
