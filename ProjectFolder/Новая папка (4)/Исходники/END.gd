extends Node2D

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().quit()

func _ready():
	pass
