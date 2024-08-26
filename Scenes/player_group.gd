extends Node2D
var players: Array = []
var index : int = 0
var player_num = 0
var rng = RandomNumberGenerator.new()
var damage = 2
var game_over = false
var player1 = "alive"
var player2 = "alive"
var player3 = "alive"
var player4 = "alive"
var player1_health: float = 7
signal enemy_turn_end
signal slime_animations

func _player1_play_attack():
	$"Player 1/AnimatedSprite2D2".play('attack')
func _player2_play_attack():
	$"Player 2/AnimatedSprite2D3".play('attack')
func _player3_play_attack():
	$"Player 3/AnimatedSprite2D3".play('attack')
func _player4_play_attack():
	$"Player 4/AnimatedSprite2D3".play('attack')

func _process(delta):
	GlobalScript.player1_health = $"Player 1".health
	if player1 == "dead":
		GlobalScript.p1damage = 0
		game_over = true
	if player2 == "dead":
		GlobalScript.p2damage = 0
	if player3 == "dead":
		GlobalScript.p3damage = 0
	if player4 == "dead":
		GlobalScript.p4damage = 0
	if game_over == true:
		GlobalScript.Gposition_x = -245
		GlobalScript.Gposition_y = -192
		GlobalScript.player_num = 0
		GlobalScript.enemy1 = "alive"
		GlobalScript.enemy2 = "alive"
		GlobalScript.enemy3 = "alive"
		GlobalScript.enemy4 = "alive"
		GlobalScript.alive_count = 4
		GlobalScript.p1damage = 3
		GlobalScript.p2damage = 3
		GlobalScript.p3damage = 3
		GlobalScript.p4damage = 3
		GlobalScript.world_enemy1 = "alive"
		GlobalScript.world_enemy2 = "alive"
		GlobalScript.world_enemy3 = "alive"
		GlobalScript.chuck_dialogue = "not_done"
		GlobalScript.player1_health = player1_health
		GlobalScript.first_time_load_in = true
		await get_tree().create_timer(0.5).timeout
		SceneSwitcher.switch_scene("res://Scenes/title_screen.tscn")


func _ready():
	GlobalScript.p1damage = 3
	GlobalScript.p2damage = 3
	GlobalScript.p3damage = 3
	GlobalScript.p4damage = 3
	$"Player 1".health = GlobalScript.player1_health
	players = get_children()
	for i in players.size():
		players[i].position = Vector2(0, i*20)
	

func _on_enemy_group_next_player():
	if index < players.size() - 1:
		index += 1
		switch_focus(index, index - 1)
	else:
		index = 0
		switch_focus( index, players.size() - 1 )

func switch_focus(x,y):
	players[x].focus()
	players[y].unfocus()

func _on_enemy_group_attacking():
	print(GlobalScript.player1_health)
	$"Player 1".unfocus()
	_player1_play_attack()
	await get_tree().create_timer(1).timeout
	_player2_play_attack()
	await get_tree().create_timer(1).timeout
	_player3_play_attack()
	await get_tree().create_timer(1).timeout
	_player4_play_attack()
	await get_tree().create_timer(1).timeout

func _on_enemy_group_enemy_turn():
	emit_signal('slime_animations')
	await get_tree().create_timer(0.7).timeout
	if GlobalScript.enemy1 == "alive":
		GlobalScript.player_num = rng.randi_range(0, 3)
		if GlobalScript.player_num == 0:
			$"Player 1".take_damage(damage)
		elif GlobalScript.player_num == 1:
			$"Player 2".take_damage(damage)
		elif GlobalScript.player_num == 2:
			$"Player 3".take_damage(damage)
		elif GlobalScript.player_num == 3:
			$"Player 4".take_damage(damage)
		await get_tree().create_timer(1).timeout
	if GlobalScript.enemy2 == "alive":
		GlobalScript.player_num = rng.randi_range(0, 3)
		if GlobalScript.player_num == 0:
			$"Player 1".take_damage(damage)
		elif GlobalScript.player_num == 1:
			$"Player 2".take_damage(damage)
		elif GlobalScript.player_num == 2:
			$"Player 3".take_damage(damage)
		elif GlobalScript.player_num == 3:
			$"Player 4".take_damage(damage)
		await get_tree().create_timer(1).timeout
	if GlobalScript.enemy3 == "alive":
		GlobalScript.player_num = rng.randi_range(0, 3)
		if GlobalScript.player_num == 0:
			$"Player 1".take_damage(damage)
		elif GlobalScript.player_num == 1:
			$"Player 2".take_damage(damage)
		elif GlobalScript.player_num == 2:
			$"Player 3".take_damage(damage)
		elif GlobalScript.player_num == 3:
			$"Player 4".take_damage(damage)
		await get_tree().create_timer(1).timeout
	if GlobalScript.enemy4 == "alive":
		GlobalScript.player_num = rng.randi_range(0, 3)
		if GlobalScript.player_num == 0:
			$"Player 1".take_damage(damage)
		elif GlobalScript.player_num == 1:
			$"Player 2".take_damage(damage)
		elif GlobalScript.player_num == 2:
			$"Player 3".take_damage(damage)
		elif GlobalScript.player_num == 3:
			$"Player 4".take_damage(damage)
		await get_tree().create_timer(1).timeout
	emit_signal('enemy_turn_end')
	$"Player 1".focus()


func _on_player_1_death():
	$"Player 1/AnimatedSprite2D2".hide()
	$"Player 1/Sprite2D".show()
	if player1 == "alive":
		print("1 is dead now")
	player1 = "dead"
	return
func _on_player_2_death():
	$"Player 2/AnimatedSprite2D3".hide()
	$"Player 2/Sprite2D2".show()
	if player2 == "alive":
		print("2 is dead now")
	player2 = "dead"
	return
func _on_player_3_death():
	$"Player 3/AnimatedSprite2D3".hide()
	$"Player 3/Sprite2D2".show()
	if player3 == "alive":
		print("3 is dead now")
	player3 = "dead"
	return
func _on_player_4_death():
	$"Player 4/AnimatedSprite2D3".hide()
	$"Player 4/Sprite2D2".show()
	if player4 == "alive":
		print("4 is dead now")
	player4 = "dead"
	return

