extends CharacterBody2D
 
@onready var _focus = $Focus
@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer
@export var MAX_HEALTH: float = 7
var player_alive = true
signal death
var player234 = true
var damage = 3
var health: float = 7:
	set(value):
		health = value
		_update_progress_bar()
		_slime_play_hurt()
		if value <= 0:
			player_death()


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
func _player2_play_idle():
	$AnimatedSprite2D3.play('idle')
func _player2_play_hurt():
	$AnimatedSprite2D3.play('hurt')
func _player2_play_death():
	$AnimatedSprite2D3.play('death')
 
func focus():
	_focus.show()
 
func unfocus():
	_focus.hide()
 
func take_damage(value):
	health -= value
	_player_play_hurt()
	_player2_play_hurt()

func _on_animated_sprite_2d_animation_finished():
	_slime_play_idle()
func _on_animated_sprite_2d_2_animation_finished():
	_player_play_idle()
func _on_animated_sprite_2d_3_animation_finished():
	_player2_play_idle()
	
func player_death():
	player_alive = false
	damage = 0
	_player_play_death()
	await get_tree().create_timer(0.85).timeout
	emit_signal('death')
