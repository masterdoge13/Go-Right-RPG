extends ProgressBar
func _ready():
	max_value=get_parent().MAXHEALTH
	value = get_parent().HEALTH
func _process(delta):
	max_value=get_parent().MAXHEALTH
	value = get_parent().HEALTH
