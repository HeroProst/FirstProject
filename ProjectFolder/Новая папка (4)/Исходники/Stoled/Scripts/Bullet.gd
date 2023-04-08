extends Node2D

var dir = Vector2(1, 0)

export var bullet_speed = 1
export var final_speed = 100


func _ready():
	pass 


func _process(delta):
	self.position += dir * delta * bullet_speed
	if ($"RayCast2D".is_colliding()):
		var collid = $"RayCast2D".get_collider().get_parent()
		if (collid.type == "PLAYER"):
			position += Vector2(2000, 2000)
			collid.Player_Heltf -= 1
			

func screen_exited():
	get_parent().remove_child(self)
	queue_free()
