extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer
onready var sprite_reaper = $Sprite

func _ready():
	animationPlayer.play("Stand")
	pass 
