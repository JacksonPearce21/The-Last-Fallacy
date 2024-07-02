extends Node2D

func _on_area_2d_player_entered1():
	GlobalScript.enemy1 = "dead"
	$Enemy.queue_free()


func _on_area_2d_player_entered2():
	GlobalScript.enemy2 = "dead"
	$Enemy2.queue_free()


func _on_area_2d_player_entered3():
	GlobalScript.enemy3 = "dead"
	$Enemy3.queue_free()
	
func _ready():
	if GlobalScript.enemy1 == "dead":
		$Enemy.queue_free()
	if GlobalScript.enemy2 == "dead":
		$Enemy2.queue_free()
	if GlobalScript.enemy3 == "dead":
		$Enemy3.queue_free()
