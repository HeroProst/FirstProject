extends KinematicBody2D

const TARGET_FPS = 60
const ACCELERATION = 10
const MAX_SPEED = 120
const FRICTION = 20
const AIR_RESISTANCE = 3
const GRAVITY = 8.5
const JUMP_FORCE = 250
var Player_Heltf = 2
var type = "PLAYER"



enum {
	IDLE,
	WALKING,
	IN_AIR,
	ROLL,
	ATTACK
}

var motion = Vector2.ZERO
var is_in_air = true
var x_input = 0
var state = IN_AIR
var jump_count = 0
var dash_vector = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	
	apply_gravity(delta)
	check_ground()
	match state:
		IDLE:
			move(delta)
			jump(delta)
			apply_friction(delta)
			dash(delta)
			Hit()
		WALKING:
			move(delta)
			jump(delta)
			dash(delta)
			Hit()
		IN_AIR:
			animationPlayer.play("jump")
			move_on_air(delta)
			apply_air_resistance(delta)
			adjust_jump(delta)
			double_jump(delta) 
			reset_speed_when_double_jump(delta)
			Hit()
		ROLL:
			dash(delta)
		ATTACK:
			attack(delta)
	
	motion = move_and_slide(motion, Vector2.UP)
func move(delta):
	if Player_Heltf >= 1:
			x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
			if x_input != 0:
				animationPlayer.play("Run")
				state = WALKING
				motion.x += x_input * ACCELERATION * delta * TARGET_FPS
				motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
				sprite.flip_h = x_input < 0
			else:
				animationPlayer.play("Stand")
				state = IDLE
	else:
		motion.x = 0
		animationPlayer.play("Stand")

func jump(delta):
	if Player_Heltf >= 1:
		if Input.is_action_just_pressed("ui_up"):
				state = IN_AIR
				motion.y = -JUMP_FORCE - 0
				animationPlayer.play("jump")
				jump_count += 1

func dash(delta):
	if Input.is_action_just_pressed("dash"):
		state = ROLL
		if x_input == 1:
			motion.x = 0
			motion.x = motion.x  * ACCELERATION + 1000
		elif x_input == 0:
			if sprite.flip_h == false:
				motion.x = motion.x  * ACCELERATION + 400
			else:motion.x = motion.x  * ACCELERATION - 400
		else:
			motion.x = 0
			motion.x = motion.x  * ACCELERATION * -1 - 1000

func double_jump(delta):
	if Player_Heltf >= 1:
		if is_on_floor():
				1
		else:
				state = IN_AIR
				if jump_count == 0:
					jump_count += 1
				if jump_count <= 1:
					if motion.x > 0:
						if Input.is_action_just_pressed("ui_up"):
							if x_input == -1:
									motion.x += motion.x * x_input
							if x_input == 1:
								motion.x += motion.x 
							state = IN_AIR
							motion.y = -JUMP_FORCE
							animationPlayer.play("jump")
							jump_count += 1
					if motion.x < 0:
						if Input.is_action_just_pressed("ui_up"):
							if x_input == -1:
									motion.x = motion.x
							if x_input == 1:
								motion.x -= motion.x * x_input
							state = IN_AIR
							motion.y = -JUMP_FORCE
							animationPlayer.play("jump")
							jump_count += 1
					if motion.x == 0:
						if Input.is_action_just_pressed("ui_up"):
							state = IN_AIR
							motion.y = -JUMP_FORCE
							animationPlayer.play("jump")
							jump_count += 1
	pass


func apply_gravity(delta):
	motion.y = clamp(motion.y, -JUMP_FORCE - 50, JUMP_FORCE +75)
	motion.y += GRAVITY * delta * TARGET_FPS
	if motion.y >= 0:
		motion.y += GRAVITY * delta * TARGET_FPS

func apply_friction(delta):
	if x_input == 0:
		motion.x = lerp(motion.x, 0, FRICTION * delta)
	pass
	
func apply_air_resistance(delta):
	if x_input == 0:
		motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	pass
	
func adjust_jump(delta):
	if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2	
	
func check_ground():
	if is_on_floor():
		state = IDLE
		jump_count = 0
	else:
		state = IN_AIR

func move_on_air(delta):
	x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")	
	if x_input != 0:
		state = WALKING
		motion.x += x_input * ACCELERATION/5 * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
	else:
		state = IDLE
	pass

func reset_speed_when_double_jump(delta):

	pass
func attack(delta):
	pass
func Hit():
	if Input.is_action_just_pressed("Hit"):
		Player_Heltf = Player_Heltf - 1

