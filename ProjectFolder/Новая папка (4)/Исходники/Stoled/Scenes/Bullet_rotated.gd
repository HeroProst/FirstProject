extends Node2D


func _ready():
	pass

func _process(delta):
	self.position += Vector2(1,0).rotated(self.rotation)

func screen_exited():
	get_parent().remove_child(self)
	queue_free()
