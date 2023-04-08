extends Node2D

var rng = RandomNumberGenerator.new()
var my_random_number: int
var boss_helth = 5
var rng_lv = RandomNumberGenerator.new()
var my_random_lever: int
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if $"Beat_the_Boss/Spr".get_overlapping_bodies().size() == 1:
			boss_helth -= 1
			$"Beat_the_Boss/Spr".visible = false
			$"Beat_the_Boss/CD".start()
		if $"Beat_the_Boss/Spr2".get_overlapping_bodies().size() == 1:
			boss_helth -= 1
			$"Beat_the_Boss/Spr2".visible = false
			$"Beat_the_Boss/CD".start()
		if $"Beat_the_Boss/Spr3".get_overlapping_bodies().size() == 1:
			boss_helth -= 1
			$"Beat_the_Boss/Spr3".visible = false
			$"Beat_the_Boss/CD".start()
		if $"Beat_the_Boss/Spr4".get_overlapping_bodies().size() == 1:
			boss_helth -= 1
			$"Beat_the_Boss/Spr4".visible = false
			$"Beat_the_Boss/CD".start()
		if $"Beat_the_Boss/Spr5".get_overlapping_bodies().size() == 1:
			boss_helth -= 1
			$"Beat_the_Boss/Spr5".visible = false
			$"Beat_the_Boss/CD".start()
		if $"Beat_the_Boss/Spr6".get_overlapping_bodies().size() == 1:
			boss_helth -= 1
			$"Beat_the_Boss/Spr6".visible = false
			$"Beat_the_Boss/CD".start()

func _process(delta):
	if $"PLAYER/Player".Player_Heltf < 1:
		$"Death".visible = true
		$"hp_bar_half".visible = false
		$"hp_bar_empty".visible = true
	if boss_helth < 1:
		$"Change_phase".stop()
		$"Squid_Boss".visible = false
		$"Teleport2".visible = true
		$"PLAYER/Player".Player_Heltf = 100
		$"Beat_the_Boss/CD".stop()
	if $"PLAYER/Player".Player_Heltf == 1:
		$"hp_bar_full".visible = false
		$"hp_bar_half".visible = true
		
	pass

func _on_Attack1_timeout():
	$"Attack_1/Straight-Shot-Enemy".visible = false
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


func _on_Attack2_timeout():
	$"Attack_2/Straight-Shot-Enemy18".visible = false
	$"Attack_2/Straight-Shot-Enemy19".visible = false
	$"Attack_2/Straight-Shot-Enemy20".visible = false
	$"Attack_2/Straight-Shot-Enemy21".visible = false
	$"Attack_2/Straight-Shot-Enemy22".visible = false
	$"Attack_2/Straight-Shot-Enemy23".visible = false
	$"Attack_2/Straight-Shot-Enemy24".visible = false
	$"Attack_2/Straight-Shot-Enemy25".visible = false
	$"Change_phase".start()


func _on_Attack3_timeout():
	$"Attack_3/Straight-Shot-Enemy18".visible = false
	$"Attack_3/Straight-Shot-Enemy19".visible = false
	$"Attack_3/Straight-Shot-Enemy20".visible = false
	$"Attack_3/Straight-Shot-Enemy21".visible = false
	$"Attack_3/Straight-Shot-Enemy22".visible = false
	$"Attack_3/Straight-Shot-Enemy23".visible = false
	$"Attack_3/Straight-Shot-Enemy24".visible = false
	$"Attack_3/Straight-Shot-Enemy25".visible = false
	$"Attack_3/Straight-Shot-Enemy26".visible = false
	$"Change_phase".start()


func _on_Change_phase_timeout():
	rng.randomize()
	my_random_number = rng.randf_range(1, 4)
	if $"Squid_Boss".visible == true:
		if my_random_number == 1:
			$"Attack_1/Attack1".start()
			$"Attack_1/Straight-Shot-Enemy".visible = true
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
		if my_random_number == 2:
			$"Attack_2/Attack2".start()
			$"Attack_2/Straight-Shot-Enemy18".visible = true
			$"Attack_2/Straight-Shot-Enemy19".visible = true
			$"Attack_2/Straight-Shot-Enemy20".visible = true
			$"Attack_2/Straight-Shot-Enemy21".visible = true
			$"Attack_2/Straight-Shot-Enemy22".visible = true
			$"Attack_2/Straight-Shot-Enemy23".visible = true
			$"Attack_2/Straight-Shot-Enemy24".visible = true
			$"Attack_2/Straight-Shot-Enemy25".visible = true
		if my_random_number == 3:
			$"Attack_3/Attack3".start()
			$"Attack_3/Straight-Shot-Enemy18".visible = true
			$"Attack_3/Straight-Shot-Enemy19".visible = true
			$"Attack_3/Straight-Shot-Enemy20".visible = true
			$"Attack_3/Straight-Shot-Enemy21".visible = true
			$"Attack_3/Straight-Shot-Enemy22".visible = true
			$"Attack_3/Straight-Shot-Enemy23".visible = true
			$"Attack_3/Straight-Shot-Enemy24".visible = true
			$"Attack_3/Straight-Shot-Enemy25".visible = true
			$"Attack_3/Straight-Shot-Enemy26".visible = true


func _on_CD_timeout():
	rng_lv.randomize()
	my_random_lever = rng_lv.randf_range(1, 7)
	if my_random_lever == 1:
		$"Beat_the_Boss/Spr".visible = true
	if my_random_lever == 2:
		$"Beat_the_Boss/Spr2".visible = true
	if my_random_lever == 3:
		$"Beat_the_Boss/Spr3".visible = true
	if my_random_lever == 4:
		$"Beat_the_Boss/Spr4".visible = true
	if my_random_lever == 5:
		$"Beat_the_Boss/Spr5".visible = true
	if my_random_lever == 6:
		$"Beat_the_Boss/Spr6".visible = true
	pass 
