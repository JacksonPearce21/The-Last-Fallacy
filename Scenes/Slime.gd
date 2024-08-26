extends CharacterBody2D

@onready var _focus = $Focus
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var progress_bar = $ProgressBar

@export var MAX_HEALTH: float = 7

func _ready():
	$AnimatedSprite2D.play("Idle")

var health: float = 7:
	set(value):
		health = value
		_update_progress_bar()
		$AnimatedSprite2D.play("Hurt")
		
func _update_progress_bar():
	progress_bar.value = (health/MAX_HEALTH) * 100

func focus():
	_focus.show()
func unfocus():
	_focus.hide()
