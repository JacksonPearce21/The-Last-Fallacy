extends Node2D
 
var enemies: Array = []
var action_queue: Array = []
var is_battling: bool = false
var index: int = 0
signal next_player
signal return_to_world
var battling = true
@onready var choice = $"../CanvasLayer/Choice"
signal attacking
signal camera_battling
var damage = 3
var alive_count = 4
var enemy1 = "alive"
var enemy2 = "alive"
var enemy3 = "alive"
var enemy4 = "alive"
signal enemy_turn
var num = 0

func _ready():
	GlobalScript.enemy1 = "alive"
	GlobalScript.enemy2 = "alive"
	GlobalScript.enemy3 = "alive"
	GlobalScript.enemy4 = "alive"
	GlobalScript.alive_count = alive_count
	emit_signal("camera_battling")
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*20)
	show_choice()
	
 
func _process(_delta):
	if not choice.visible:
		if Input.is_action_just_pressed("ui_up"):
			if index > 0:
				index -= 1
				switch_focus(index, index+1)
 
		if Input.is_action_just_pressed("ui_down"):
			if index < enemies.size() - 1:
				index += 1
				switch_focus(index, index - 1)

		if Input.is_action_just_pressed("ui_accept"):
			if battling:
				action_queue.push_back(index)
				emit_signal("next_player")
	 
	if action_queue.size() == enemies.size() and not is_battling:
		is_battling = true
		_action(action_queue)
		_reset_focus()
		
		
	if GlobalScript.alive_count == 0:
		emit_signal("return_to_world")

func _action(stack):
	battling = false
	emit_signal("attacking")
	for i in stack:
		num += 1
		if num == 1:
			enemies[i].take_damage(GlobalScript.p1damage)
		elif num == 2:
			enemies[i].take_damage(GlobalScript.p2damage)
		elif num == 3:
			enemies[i].take_damage(GlobalScript.p3damage)
		elif num == 4:
			enemies[i].take_damage(GlobalScript.p4damage)
		await get_tree().create_timer(1).timeout
	num = 0
	action_queue.clear()
	emit_signal("enemy_turn")

func switch_focus(x,y):
	enemies[x].focus()
	enemies[y].unfocus()
 
func show_choice():
	choice.show()
	choice.find_child("Attack").grab_focus()
 
func _reset_focus():
	index = 0
	for enemy in enemies:
		enemy.unfocus()
 
func _start_choosing():
	_reset_focus()
	enemies[0].focus()

func _on_attack_pressed():
	choice.hide()
	_start_choosing()


func _on_enemy_1_death():
	$"Enemy 1/AnimatedSprite2D".hide()
	$"Enemy 1/Sprite2D2".show()
	if enemy1 == "alive":
		GlobalScript.alive_count -= 1
	enemy1 = "dead"
	GlobalScript.enemy1 = "dead"
	return
func _on_enemy_2_death():
	$"Enemy 2/AnimatedSprite2D".hide()
	$"Enemy 2/Sprite2D2".show()
	if enemy2 == "alive":
		GlobalScript.alive_count -= 1
	enemy2 = "dead"
	GlobalScript.enemy2 = "dead"
	return
func _on_enemy_3_death():
	$"Enemy 3/AnimatedSprite2D".hide()
	$"Enemy 3/Sprite2D2".show()
	if enemy3 == "alive":
		GlobalScript.alive_count -= 1
	enemy3 = "dead"
	GlobalScript.enemy3 = "dead"
	return
func _on_enemy_4_death():
	$"Enemy 4/AnimatedSprite2D".hide()
	$"Enemy 4/Sprite2D2".show()
	if enemy4 == "alive":
		GlobalScript.alive_count -= 1
	enemy4 = "dead"
	GlobalScript.enemy4 = "dead"
	return

func _enemy1_play_attack():
	$"Enemy 1/AnimatedSprite2D".play('attack')
func _enemy2_play_attack():
	$"Enemy 2/AnimatedSprite2D".play('attack')
func _enemy3_play_attack():
	$"Enemy 3/AnimatedSprite2D".play('attack')
func _enemy4_play_attack():
	$"Enemy 4/AnimatedSprite2D".play('attack')


func _on_player_group_enemy_turn_end():
	is_battling = false
	show_choice()
	battling = true


func _on_player_group_slime_animations():
	if enemy1 == "alive":
		_enemy1_play_attack()
		await get_tree().create_timer(1).timeout
	if enemy2 == "alive":
		_enemy2_play_attack()
		await get_tree().create_timer(1).timeout
	if enemy3 == "alive":
		_enemy3_play_attack()
		await get_tree().create_timer(1).timeout
	if enemy4 == "alive":
		_enemy4_play_attack()
		await get_tree().create_timer(1).timeout
