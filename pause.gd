extends Control

signal resume_game
signal go_to_main_menu

func _ready():
	$VBoxContainer/Resume.grab_focus()

func _on_resume_pressed():
	emit_signal("resume_game")

func _on_quit_pressed():
	emit_signal("go_to_main_menu")

func _on_visibility_changed():
	$VBoxContainer/Resume.grab_focus()
