extends Label
@export var ball: NodePath

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/SpeedLabel.text = str(get_node(player_one).score)
	pass
