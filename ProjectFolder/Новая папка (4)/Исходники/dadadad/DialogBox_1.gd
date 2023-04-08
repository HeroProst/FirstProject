extends Control

var dialog = [
	"Поздравляю с прохождением Альфа-бета-омега-сигма версии игры",
	"Спасибо за игру"
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
		
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
