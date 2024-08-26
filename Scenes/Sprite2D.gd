extends Sprite2D

func _process(delta):
	var degrees_per_second = 90
	rotate(delta * deg_to_rad(degrees_per_second))
