extends CharacterBody2D

var current_dir = "none"
const SPEED = 55
func _ready():
	$AnimatedSprite2D.play("side_idle")
	if not_battling:
		position.x = GlobalScript.Gposition_x
		position.y = GlobalScript.Gposition_y
var not_battling = true
signal camera_off
signal camera_on
var position_x 
var position_y


func _physics_process(delta):
	player_movement(delta)
	if not_battling:
		emit_signal("camera_on")

func player_movement(delta):
	if not_battling:
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			velocity.y = 0
			current_dir = "right"
			play_anim(1)
		elif Input.is_action_pressed("ui_left"):
			current_dir = "left"
			play_anim(1)
			velocity.x = -SPEED
			velocity.y = 0
		elif Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
			velocity.x = 0
			current_dir = "up"
			play_anim(1)
		elif Input.is_action_pressed("ui_down"):
			velocity.y = SPEED
			velocity.x = 0
			current_dir = "down"
			play_anim(1)
		else:
			play_anim(0)
			velocity.x = 0
			velocity.y = 0
			
		move_and_slide()
			
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if not_battling:
		
		if dir == "right":
			anim.flip_h = false
			if movement == 1:
				anim.play("side_walk")
			elif movement == 0:
				anim.play("side_idle")
		elif dir == "left":
			anim.flip_h = true
			if movement == 1:
				anim.play("side_walk")
			elif movement == 0:
				anim.play("side_idle")
		elif dir == "up":
			anim.flip_h = true
			if movement == 1:
				anim.play("back_walk")
			elif movement == 0:
				anim.play("back_idle")
		elif dir == "down":
			anim.flip_h = true
			if movement == 1:
				anim.play("front_walk")
			elif movement == 0:
				anim.play("front_idle")

func _on_area_2d_player_entered():
	position_x = position.x
	GlobalScript.Gposition_x = position_x
	position_y = position.y
	GlobalScript.Gposition_y = position_y
	print(position_x)

func _on_enemy_group_return_to_world():
	not_battling = true
	print(GlobalScript.Gposition_x)
	SceneSwitcher.switch_scene("res://Scenes/world.tscn")


func _on_enemy_group_camera_battling():
	not_battling = false
	print("camera_off")
	emit_signal("camera_off")
