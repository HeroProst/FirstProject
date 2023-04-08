extends Area2D

var type = "Lever"
onready var boss = get_parent().get_parent().get_node("Boss")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print(get_overlapping_bodies().size())
		if get_overlapping_bodies().size() == 1:
			pass


func _ready():
	pass
