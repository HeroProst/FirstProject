extends Node2D
onready var bullet_scene = load("res://Stoled/Scenes/Bullet.tscn")
var rng = RandomNumberGenerator.new()
var my_random_number: int
var rng_lv = RandomNumberGenerator.new()
var my_random_lever: int
onready var dialog_scene = load("res://DialogBo_1.tscn")

func _ready():
	pass
	
func _process(delta):
	if $"Boss".visible == true:
		if $"Boss".Boss_HElth <= 0:
			$"PLAYER/Player2".Player_Heltf = 100
			$"Boss".visible = false
			$"lever/Straight-Shot-Enemy".visible = false
			$"lever/Straight-Shot-Enemy2".visible = false
			$"lever/Straight-Shot-Enemy3".visible = false
			$"Change_phase".stop()
			$"Attack_1/Attack_1".stop()
			$"Attack4/Attack4".stop()
			$"Attack2/Straight-Shot-Enemy".visible = false
			$"Attack2/Straight-Shot-Enemy2".visible = false
			$"Attack2/Straight-Shot-Enemy3".visible = false
			$"Attack3/Straight-Shot-Enemy".visible = false
			$"Attack3/Straight-Shot-Enemy2".visible = false
			$"Attack3/Straight-Shot-Enemy3".visible = false
			$"Attack3/Straight-Shot-Enemy7".visible = false
			$"Attack3/Straight-Shot-Enemy4".visible = false
			$"Attack3/Straight-Shot-Enemy5".visible = false
			$"Attack3/Straight-Shot-Enemy6".visible = false
			$"Attack3/Straight-Shot-Enemy8".visible = false
			$"Teleport_Next".visible = true
	if $"PLAYER/Player2".Player_Heltf == 1:
		$"hp_bar_full".visible = false
		$"hp_bar_half".visible = true
	if $"PLAYER/Player2".Player_Heltf < 1:
		$"hp_bar_half".visible = false
		$"hp_bar_empty".visible = true

func _input(event):
	var dialog = dialog_scene.instance()
	if $"PLAYER/Player2".Player_Heltf < 1:
		if event.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://Level_3.tscn")
	if event.is_action_pressed("ui_accept"):
		if $"lever/Area2D".get_overlapping_bodies().size() == 1:
				$"Boss".visible = true
				$"Change_phase".start()
				$"lever/Straight-Shot-Enemy".visible = true
				$"lever/Straight-Shot-Enemy2".visible = true
				$"lever/Straight-Shot-Enemy3".visible = true
				$"lever/Area2D".visible = false
				$"LEVER/CD".start()
				$"hp_bar_full".visible = true
				
	if event.is_action_pressed("ui_down"):
		$'Timer'.start()
		$"KinematicBody2D".collision_mask = $"KinematicBody2D".collision_mask - 1
		$"KinematicBody2D1".collision_mask = $"KinematicBody2D1".collision_mask -1
		$"KinematicBody2D2".collision_mask = $"KinematicBody2D2".collision_mask -1
		$"KinematicBody2D3".collision_mask = $"KinematicBody2D3".collision_mask -1
		$"KinematicBody2D4".collision_mask = $"KinematicBody2D4".collision_mask -1
		$"KinematicBody2D5".collision_mask = $"KinematicBody2D5".collision_mask -1
		$"KinematicBody2D6".collision_mask = $"KinematicBody2D6".collision_mask -1
	if event.is_action_pressed("ui_accept"):
		if $"lever/Area2D".get_overlapping_bodies().size() == 1:
				$"lever/Teleport".visible = false
		if $"LEVER/LEVER1".get_overlapping_bodies().size() == 1:
			if $"LEVER/LEVER1".visible == true:
				$"Boss".Boss_HElth -= 1
				$"LEVER/LEVER1".visible = false
				$"LEVER/CD".start()
		if $"LEVER/LEVER2".get_overlapping_bodies().size() == 1:
			if $"LEVER/LEVER2".visible == true:
				$"Boss".Boss_HElth -= 1
				$"LEVER/LEVER2".visible = false
				$"LEVER/CD".start()
		if $"LEVER/LEVER3".get_overlapping_bodies().size() == 1:
			if $"LEVER/LEVER3".visible == true:
				$"Boss".Boss_HElth -= 1
				$"LEVER/LEVER3".visible = false
				$"LEVER/CD".start()
		if $"LEVER/LEVER4".get_overlapping_bodies().size() == 1:
			if $"LEVER/LEVER4".visible == true:
				$"Boss".Boss_HElth -= 1
				$"LEVER/LEVER4".visible = false
				$"LEVER/CD".start()

func _on_Timer_timeout():
	$"KinematicBody2D".collision_mask = $"KinematicBody2D".collision_mask -1
	$"KinematicBody2D1".collision_mask = $"KinematicBody2D1".collision_mask -1
	$"KinematicBody2D2".collision_mask = $"KinematicBody2D2".collision_mask -1
	$"KinematicBody2D3".collision_mask = $"KinematicBody2D3".collision_mask -1
	$"KinematicBody2D4".collision_mask = $"KinematicBody2D4".collision_mask -1
	$"KinematicBody2D5".collision_mask = $"KinematicBody2D5".collision_mask -1
	$"KinematicBody2D6".collision_mask = $"KinematicBody2D6".collision_mask -1
	pass 



func _on_Timer2_timeout():
	if $"PLAYER/Player2".Player_Heltf < 1:
		$"DEATH".visible = true
	if $"PLAYER/Player2".position.x <= 440.0:
		$"Boss/Sprite".flip_h = true
	else:
		$"Boss/Sprite".flip_h = false
	pass 
	


func _on_Change_phase_timeout():
	$"Change_phase".set_wait_time(5)
	rng.randomize()
	my_random_number = rng.randf_range(1, 5)
	print(my_random_number)
	if $"Boss".visible == true:
		if my_random_number == 1:
			$"Attack_1/Attack_1".start()
			$"Boss/AnimationPlayer2".play("Begin")
		if my_random_number == 2:
			$"Attack2/Attack2".start()
			$"Attack2/Straight-Shot-Enemy".visible = true
			$"Attack2/Straight-Shot-Enemy2".visible = true
			$"Attack2/Straight-Shot-Enemy3".visible = true
		if my_random_number == 3:
			$"Attack3/Attack3".start()
			$"Attack3/Straight-Shot-Enemy".visible = true
			$"Attack3/Straight-Shot-Enemy2".visible = true
			$"Attack3/Straight-Shot-Enemy3".visible = true
			$"Attack3/Straight-Shot-Enemy7".visible = true
		if my_random_number == 4:
			$"Attack4/Attack4".start()
			$"Boss/AnimationPlayer2".play("Begin_2")



func _on_Attack_1_timeout():
	$"Attack_1/Attack_1_end".start()
	$"Attack_1/Straight-Shot-Enemy".visible = true
	$"Attack_1/Straight-Shot-Enemy18".visible = true
	$"Attack_1/Straight-Shot-Enemy2".visible = true
	$"Attack_1/Straight-Shot-Enemy3".visible = true
	$"Attack_1/Straight-Shot-Enemy4".visible = true
	$"Attack_1/Straight-Shot-Enemy5".visible = true
	$"Attack_1/Straight-Shot-Enemy6".visible = true
	$"Attack_1/Straight-Shot-Enemy7".visible = true
	$"Attack_1/Straight-Shot-Enemy8".visible = true
	$"Attack_1/Straight-Shot-Enemy9".visible = true
	$"Attack_1/Straight-Shot-Enemy10".visible = true
	$"Attack_1/Straight-Shot-Enemy11".visible = true
	$"Attack_1/Straight-Shot-Enemy12".visible = true
	$"Attack_1/Straight-Shot-Enemy13".visible = true
	$"Attack_1/Straight-Shot-Enemy14".visible = true
	$"Attack_1/Straight-Shot-Enemy15".visible = true
	$"Attack_1/Straight-Shot-Enemy16".visible = true
	$"Attack_1/Straight-Shot-Enemy17".visible = true
func _on_Attack_1_end_timeout():
	$"Attack_1/Straight-Shot-Enemy".visible = false
	$"Attack_1/Straight-Shot-Enemy18".visible = false
	$"Attack_1/Straight-Shot-Enemy2".visible = false
	$"Attack_1/Straight-Shot-Enemy3".visible = false
	$"Attack_1/Straight-Shot-Enemy4".visible = false
	$"Attack_1/Straight-Shot-Enemy5".visible = false
	$"Attack_1/Straight-Shot-Enemy6".visible = false
	$"Attack_1/Straight-Shot-Enemy7".visible = false
	$"Attack_1/Straight-Shot-Enemy8".visible = false
	$"Attack_1/Straight-Shot-Enemy9".visible = false
	$"Attack_1/Straight-Shot-Enemy10".visible = false
	$"Attack_1/Straight-Shot-Enemy11".visible = false
	$"Attack_1/Straight-Shot-Enemy12".visible = false
	$"Attack_1/Straight-Shot-Enemy13".visible = false
	$"Attack_1/Straight-Shot-Enemy14".visible = false
	$"Attack_1/Straight-Shot-Enemy15".visible = false
	$"Attack_1/Straight-Shot-Enemy16".visible = false
	$"Attack_1/Straight-Shot-Enemy17".visible = false
	$"Change_phase".start()
	$"Boss/AnimationPlayer2".play("Stand")


func _on_Attack2_timeout():
	$"Attack2/Straight-Shot-Enemy".visible = false
	$"Attack2/Straight-Shot-Enemy2".visible = false
	$"Attack2/Straight-Shot-Enemy3".visible = false
	$"Change_phase".start()


func _on_Attack3_timeout():
	$"Attack3/Attack3_phase2".start()
	$"Attack3/Straight-Shot-Enemy".visible = false
	$"Attack3/Straight-Shot-Enemy2".visible = false
	$"Attack3/Straight-Shot-Enemy3".visible = false
	$"Attack3/Straight-Shot-Enemy7".visible = false
	$"Attack3/Straight-Shot-Enemy4".visible = true
	$"Attack3/Straight-Shot-Enemy5".visible = true
	$"Attack3/Straight-Shot-Enemy6".visible = true
	$"Attack3/Straight-Shot-Enemy8".visible = true


func _on_Attack3_phase2_timeout():
	$"Attack3/Straight-Shot-Enemy4".visible = false
	$"Attack3/Straight-Shot-Enemy5".visible = false
	$"Attack3/Straight-Shot-Enemy6".visible = false
	$"Attack3/Straight-Shot-Enemy8".visible = false
	$"Change_phase".start()


func _on_Attack4_timeout():
	$"Attack4/Attack4_end".start()
	$"Attack4/Straight-Shot-Enemy19".visible = true
	$"Attack4/Straight-Shot-Enemy20".visible = true
	$"Attack4/Straight-Shot-Enemy21".visible = true
	$"Attack4/Straight-Shot-Enemy22".visible = true
	$"Attack4/Straight-Shot-Enemy23".visible = true
	$"Attack4/Straight-Shot-Enemy24".visible = true
	$"Attack4/Straight-Shot-Enemy25".visible = true
	$"Attack4/Straight-Shot-Enemy26".visible = true
	$"Attack4/Straight-Shot-Enemy27".visible = true
	$"Attack4/Straight-Shot-Enemy28".visible = true
	$"Attack4/Straight-Shot-Enemy29".visible = true
	$"Attack4/Straight-Shot-Enemy30".visible = true
	$"Attack4/Straight-Shot-Enemy31".visible = true
	$"Attack4/Straight-Shot-Enemy32".visible = true
	$"Attack4/Straight-Shot-Enemy33".visible = true
	$"Attack4/Straight-Shot-Enemy34".visible = true
	$"Attack4/Straight-Shot-Enemy35".visible = true
	$"Attack4/Straight-Shot-Enemy37".visible = true
	$"Attack4/Straight-Shot-Enemy38".visible = true
	$"Attack4/Straight-Shot-Enemy39".visible = true
	$"Attack4/Straight-Shot-Enemy40".visible = true
	$"Attack4/Straight-Shot-Enemy36".visible = true
	$"Attack4/Straight-Shot-Enemy41".visible = true
	$"Attack4/Straight-Shot-Enemy42".visible = true

func _on_Attack4_end_timeout():
	$"Attack4/Straight-Shot-Enemy19".visible = false
	$"Attack4/Straight-Shot-Enemy20".visible = false
	$"Attack4/Straight-Shot-Enemy21".visible = false
	$"Attack4/Straight-Shot-Enemy22".visible = false
	$"Attack4/Straight-Shot-Enemy23".visible = false
	$"Attack4/Straight-Shot-Enemy24".visible = false
	$"Attack4/Straight-Shot-Enemy25".visible = false
	$"Attack4/Straight-Shot-Enemy26".visible = false
	$"Attack4/Straight-Shot-Enemy27".visible = false
	$"Attack4/Straight-Shot-Enemy28".visible = false
	$"Attack4/Straight-Shot-Enemy29".visible = false
	$"Attack4/Straight-Shot-Enemy30".visible = false
	$"Attack4/Straight-Shot-Enemy31".visible = false
	$"Attack4/Straight-Shot-Enemy32".visible = false
	$"Attack4/Straight-Shot-Enemy33".visible = false
	$"Attack4/Straight-Shot-Enemy34".visible = false
	$"Attack4/Straight-Shot-Enemy35".visible = false
	$"Attack4/Straight-Shot-Enemy37".visible = false
	$"Attack4/Straight-Shot-Enemy38".visible = false
	$"Attack4/Straight-Shot-Enemy39".visible = false
	$"Attack4/Straight-Shot-Enemy40".visible = false
	$"Attack4/Straight-Shot-Enemy36".visible = false
	$"Attack4/Straight-Shot-Enemy41".visible = false
	$"Attack4/Straight-Shot-Enemy42".visible = false
	$"Change_phase".start()
	$"Boss/AnimationPlayer2".play("Stand")

func _on_CD_timeout():
	$"LEVER/CD".set_wait_time(5)
	rng_lv.randomize()
	my_random_lever = rng_lv.randf_range(1, 5)
	if my_random_lever == 1:
		$"LEVER/LEVER1".visible = true
	if my_random_lever == 2:
		$"LEVER/LEVER2".visible = true
	if my_random_lever == 3:
		$"LEVER/LEVER3".visible = true
	if my_random_lever == 4:
		$"LEVER/LEVER4".visible = true
	pass 
