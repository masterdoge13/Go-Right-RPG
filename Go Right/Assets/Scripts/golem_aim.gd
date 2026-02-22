extends Node2D
func _process(_delta):
	if get_parent().aggro_bool && get_parent().move_bool:
		look_at(get_parent().target.global_position)
