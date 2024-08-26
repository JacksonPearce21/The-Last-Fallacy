extends Control

func _on_start_pressed():
	$Transition.play('fade')

func _on_quit_pressed():
	get_tree().quit()

func _on_transition_animation_finished(anim_name):
	SceneSwitcher.switch_scene("res://Scenes/world.tscn")
