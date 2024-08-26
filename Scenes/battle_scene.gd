extends Node2D

func _ready():
	$Transition.play('fade_2')


func _on_player_fade_out():
	$Transition.play('fade')
