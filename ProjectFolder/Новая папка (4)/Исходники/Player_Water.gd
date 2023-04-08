extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 100
const FRICTION = 500

onready var sprite = $Sprite
onready var animated = $AnimationPlayer
var type = "PLAYER"
var Player_Heltf = 2

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			pass
	
func move_state(delta):
	animated.play("swim")
	if Player_Heltf > 0:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		if input_vector.x < 0:
			sprite.flip_h = true
		if input_vector.x > 0:
			sprite.flip_h = false
		if input_vector != Vector2.ZERO:
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)
	
