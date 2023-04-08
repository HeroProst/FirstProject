extends Node2D


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_down"):
		$'Timer'.start()
		$"KinematicBody2D".collision_mask = $"KinematicBody2D".collision_mask -1
		$"KinematicBody2D2".collision_mask = $"KinematicBody2D2".collision_mask -1
		$"KinematicBody2D3".collision_mask = $"KinematicBody2D3".collision_mask -1
		$"KinematicBody2D4".collision_mask = $"KinematicBody2D4".collision_mask -1
		$"KinematicBody2D5".collision_mask = $"KinematicBody2D5".collision_mask -1
		$"KinematicBody2D6".collision_mask = $"KinematicBody2D6".collision_mask -1
		$"KinematicBody2D7".collision_mask = $"KinematicBody2D7".collision_mask -1
		




func _on_Timer_timeout():
	$"KinematicBody2D".collision_mask = $"KinematicBody2D".collision_mask -1
	$"KinematicBody2D2".collision_mask = $"KinematicBody2D2".collision_mask -1
	$"KinematicBody2D3".collision_mask = $"KinematicBody2D3".collision_mask -1
	$"KinematicBody2D4".collision_mask = $"KinematicBody2D4".collision_mask -1
	$"KinematicBody2D5".collision_mask = $"KinematicBody2D5".collision_mask -1
	$"KinematicBody2D6".collision_mask = $"KinematicBody2D6".collision_mask -1
	$"KinematicBody2D7".collision_mask = $"KinematicBody2D7".collision_mask -1
	pass 
