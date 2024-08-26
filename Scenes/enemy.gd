extends CharacterBody2D

var speed = 45
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play('moving')
	else:
		$AnimatedSprite2D.play('idle')
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


