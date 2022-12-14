extends Control

@onready var music_player = $AudioStreamPlayer
@onready var blip_player = $AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_options_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()


func play_blip():
	blip_player.playing = true


func _on_start_button_focus_exited():
	play_blip()


func _on_options_button_focus_exited():
	play_blip()


func _on_quit_button_focus_exited():
	play_blip()
