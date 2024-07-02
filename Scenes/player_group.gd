extends Node2D
var players: Array = []
var index : int = 0


func _player1_play_attack():
	$"Player 1/AnimatedSprite2D2".play('attack')
func _player2_play_attack():
	$"Player 2/AnimatedSprite2D2".play('attack')
func _player3_play_attack():
	$"Player 3/AnimatedSprite2D2".play('attack')
func _player4_play_attack():
	$"Player 4/AnimatedSprite2D2".play('attack')

func _ready():
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
	$"Player 1".unfocus()
	_player1_play_attack()
	await get_tree().create_timer(1).timeout
	_player2_play_attack()
	await get_tree().create_timer(1).timeout
	_player3_play_attack()
	await get_tree().create_timer(1).timeout
	_player4_play_attack()
	await get_tree().create_timer(1).timeout
	$"Player 1".focus()
