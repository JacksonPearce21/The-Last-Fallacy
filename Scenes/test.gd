extends Node2D
signal return_to_cords

func _on_enemy_group_return_to_world():
	print("here")
	emit_signal("return_to_cords")
