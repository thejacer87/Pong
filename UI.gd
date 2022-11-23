extends Control
@export var player_one: NodePath
@export var player_two: NodePath


# Called when the node enters the scene tree for the first time.
func _ready():
	print('UI 1', player_one)
	print('UI 2', player_two)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("MarginContainer/Score").text = str(get_node(player_one).score)
	get_node("MarginContainer2/Score").text = str(get_node(player_two).score)
	pass

