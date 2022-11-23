extends Area2D

@export var node_path: NodePath

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Score Zone Ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body:Ball):
	var paddle: Paddle = get_node(node_path)
	paddle.add_points(1)
	print(paddle.score)
	print(body.name)
	# Set player score
	pass # Replace with function body.
