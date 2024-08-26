extends Camera2D

func _on_player_camera_off():
	print("hello")
	set_process(false)

func _on_player_camera_on():
	set_process(true)
