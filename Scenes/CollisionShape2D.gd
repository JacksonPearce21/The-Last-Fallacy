extends CollisionShape2D

func _on_child_entered_tree(node):
	get_tree().change_scene("res://Scenes/battle_scene.tscn")
