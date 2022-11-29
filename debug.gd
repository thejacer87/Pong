extends Control
@export var ball: NodePath
@export var paddle: NodePath

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/SpeedLabel.text = 'Ball Speed: ' + str(get_node(ball).speed)
	$MarginContainer2/BounceLabel.text = 'Bounce Count: ' + str(get_node(ball).bounce_counter)
	$MarginContainer3/CollisionLabel.text = 'Collision: ' + str(get_node(paddle).get_node("CollisionShape2D").disabled)
	pass
