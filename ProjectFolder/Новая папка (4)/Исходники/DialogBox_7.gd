extends Control

var dialog = [
	"Ты отлично справился со своей задачей",
	"Прощай, жук"
]

var dialog_index = 0
var finished = false


func _process(delta):
	$"next-indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		if visible == true:
			load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		visible = false
		next_level()
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true

func next_level():
	var ERR = get_tree().change_scene("res://END.tscn")
	if ERR != OK:
		print("something is wrong")
