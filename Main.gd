extends Node2D

@onready var ball = $Ball
@onready var paddle_1 = $Paddle
@onready var paddle_2 = $AI
@onready var zone_1 = $ScoringZone1
@onready var zone_2 = $ScoringZone2
@onready var pause = $Pause

const winning_score = 2

func _ready():
	reset()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		pause_game()
	
func on_scored(paddle):
	paddle.add_points()
	ball.reset_ball()
	
	if paddle_1.score >= winning_score:
		show_gameover("Congrats, Player 1 \n You won!")
	if paddle_2.score >= winning_score:
		show_gameover("Congrats, Player 2 \n You won!")

func show_gameover(message: String):
	get_tree().paused = true
	var gameover = preload("res://gameover.tscn").instantiate()
	gameover.set_message(message)
	get_tree().get_root().add_child(gameover)

func reset():
	unpause_game()
	zone_1.scored.connect(on_scored.bind(paddle_2))
	zone_2.scored.connect(on_scored.bind(paddle_1))
	paddle_1.score = 0
	paddle_2.score = 0
	pause.resume_game.connect(unpause_game)
	pause.go_to_main_menu.connect(go_to_main_menu)

func pause_game():
	pause.visible = true
	get_tree().paused = true

func unpause_game():
	pause.visible = false
	get_tree().paused = false

func go_to_main_menu():
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")
