extends CharacterBody2D

var moving = true
const SPEED = 3
var dir = Vector2.RIGHT

func _physics_process(delta):
	player_movement(delta)

func _process(delta):
	if position.x >= 1400:
		position.x = -100

func player_movement(delta):
	if moving == true:
		move(1)

func move(delta):
	position += dir * SPEED * delta
	$AnimatedSprite2D.play("side_walk")


func _ready():
	velocity.x = SPEED
	velocity.y = 0
	
	


