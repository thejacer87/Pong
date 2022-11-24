extends Area2D

signal scored

func _on_body_entered(body):
	emit_signal("scored")
