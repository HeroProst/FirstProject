extends Area2D

export(PackedScene) var target_scene
onready var animationPlayer = $AnimationPlayer
onready var sprite_reaper = $Sprite

func _ready():
	animationPlayer.play("Stand")
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if !target_scene:
			print("no scene")
			return
		if get_overlapping_bodies().size() == 1:
			if visible == true:
				next_level()
func next_level():
	var ERR = get_tree().change_scene_to(target_scene)
	if ERR != OK:
		print("something is wrong")

