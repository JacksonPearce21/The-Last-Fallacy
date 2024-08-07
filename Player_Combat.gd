extends CharacterBody2D
 
@onready var _focus = $Focus
@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer
@export var MAX_HEALTH: float = 7

var health: float = 7:
	set(value):
		health = value
		_update_progress_bar()
		_slime_play_hurt()
func _update_progress_bar():
	progress_bar.value = (health/MAX_HEALTH) * 100

func _player_play_idle():
	$AnimatedSprite2D2.play('idle')
func _player_play_hurt():
	$AnimatedSprite2D2.play('hurt')
func _player_play_death():
	$AnimatedSprite2D2.play('death')
func _slime_play_idle():
	$AnimatedSprite2D.play('idle')
func _slime_play_hurt():
	$AnimatedSprite2D.play('hurt')
 
func focus():
	_focus.show()
 
func unfocus():
	_focus.hide()
 
func take_damage(value):
	health -= value

func _on_animated_sprite_2d_animation_finished():
	_slime_play_idle()
func _on_animated_sprite_2d_2_animation_finished():
	_player_play_idle()

