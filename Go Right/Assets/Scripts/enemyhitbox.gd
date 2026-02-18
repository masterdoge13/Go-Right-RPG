extends Area2D
signal take_damage(damage)
func hit(damage):
	take_damage.emit(damage)
	print("take damage")
	
