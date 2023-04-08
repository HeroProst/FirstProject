extends Area2D

onready var animationPlayer = $AnimationPlayer
onready var sprite_reaper = $Sprite

func _ready():
	animationPlayer.play("Stand")
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		print(get_overlapping_bodies().size())
		if get_overlapping_bodies().size() == 3:
			if visible == true:
				next_level()
func next_level():
	var ERR = get_tree().change_scene("res://Level_5.tscn")
	if ERR != OK:
		print("something is wrong")
