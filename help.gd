extends Node2D

var working = true

func run_dialogue(dialogue_string):
	if working:
		Dialogic.start(dialogue_string)

func _on_help_button_pressed():
	run_dialogue('tutorials')

func _on_player_turn_off_help():
	working = false

func _on_player_turn_on_help():
	working = true
