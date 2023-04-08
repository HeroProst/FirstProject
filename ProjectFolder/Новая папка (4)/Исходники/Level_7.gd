extends Node2D


func _ready():
	pass
	
	pass
func reload_level(event):
	if $"Player".Player_Heltf < 1:
			$"DEATH".visible = true

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if $"Player".Player_Heltf < 1:
			$"DEATH".visible = true
			$"DEATH_ZONE".reload_level()


func _on_Timer_timeout():
	if $"Player".position.x <= 404.0:
		$"Reaper/Sprite".flip_h = true
	else:
		$"Reaper/Sprite".flip_h = false
	if $"DEATH_ZONE".get_overlapping_bodies().size() > 0:
		$"Player".Player_Heltf = 0
		$"DEATH".visible = true
		


