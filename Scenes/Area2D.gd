extends Area2D
var entered = false
var player = null
signal player_entered
signal remove_please
var remove = "no"

func _on_body_entered(body):
	print("entered")
	player = body
	entered = true

func _process(delta):
	if entered == true:
		emit_signal("player_entered")
		SceneSwitcher.switch_scene("res://Scenes/battle_scene.tscn")

		

		
