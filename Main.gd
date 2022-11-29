extends Node2D

@onready var ball = $Ball
@onready var paddle_1 = $Paddle
@onready var paddle_2 = $AI
@onready var zone_1 = $ScoringZone1
@onready var zone_2 = $ScoringZone2

# Called when the node enters the scene tree for the first time.
func _ready():
	zone_1.connect("scored", _on_scored.bind(paddle_2))
	zone_2.scored.connect(_on_scored.bind(paddle_1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_scored(paddle): 
	paddle.add_points()
	ball.reset_ball()
