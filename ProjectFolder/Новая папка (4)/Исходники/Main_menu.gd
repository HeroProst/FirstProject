eextends Control


onready var resume_button = $VBoxContainer/ResumeButton




func open():
	resume_button.grab_focus()


func _on_ResumeButton_pressed():
	var ERR = get_tree().change_scene("res://Level_1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
