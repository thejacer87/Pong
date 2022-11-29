extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_message(message: String):
	$VBoxContainer/Label.text = message

func _on_replay_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")

