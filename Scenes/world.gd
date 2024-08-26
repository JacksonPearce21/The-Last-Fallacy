extends Node2D

func _process(delta):
	Dialogic.signal_event.connect(DialogicSignal)

func DialogicSignal(arg: String):
	if arg == "Tutorial":
		Dialogic.start('tutorials')

func _on_area_2d_player_entered1():
	GlobalScript.world_enemy1 = "dead"
	$Enemy.queue_free()

func _on_area_2d_player_entered2():
	GlobalScript.world_enemy2 = "dead"
	$Enemy2.queue_free()

func _on_area_2d_player_entered3():
	GlobalScript.world_enemy3 = "dead"
	$Enemy3.queue_free()
	
func _ready():
	if GlobalScript.first_time_load_in == true:
		$Transition.play('fade_3')
		Dialogic.start('opening')
	if GlobalScript.first_time_load_in == false:
		$Transition.play('fade_2')
	if GlobalScript.world_enemy1 == "dead":
		$Enemy.queue_free()
	if GlobalScript.world_enemy2 == "dead":
		$Enemy2.queue_free()
	if GlobalScript.world_enemy3 == "dead":
		$Enemy3.queue_free()
	if GlobalScript.chuck_dialogue == "done":
		$"NPC 1".queue_free()
