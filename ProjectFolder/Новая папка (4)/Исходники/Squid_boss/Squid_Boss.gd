extends KinematicBody2D

onready var animated = $AnimationPlayer

func _ready():
	animated.play("stand")
	pass
