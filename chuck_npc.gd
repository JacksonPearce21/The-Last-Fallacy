extends CharacterBody2D

const SPEED = 100
var dir
var is_roaming = true
var is_chatting = false
var start_pos
var chat = 1
var player
var player_in_chat_zone = false
signal restrict_player
signal release_player
signal leave_scene

func run_dialogue(dialogue_string):
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "Exit":
		dir = Vector2.UP
		await get_tree().create_timer(1.5).timeout
		GlobalScript.chuck_dialogue = "done"
		emit_signal("release_player")


func _ready():
	randomize()
	start_pos = position
	Dialogic.signal_event.connect(DialogicSignal)

func _process(delta):
	if is_chatting:
		emit_signal("restrict_player")
		$AnimatedSprite2D.play("front_idle")
	if player_in_chat_zone:
		if chat == 1:
			run_dialogue("item recieving")
			chat += 1
	Dialogic.signal_event.connect(DialogicSignal)
	if dir == Vector2.UP:
		is_chatting = false
		move(delta)

func move(delta):
	if !is_chatting:
		position += dir * SPEED * delta
		$AnimatedSprite2D.play("walk_n")
	

func _on_chat_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		


func _on_chat_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false
	

