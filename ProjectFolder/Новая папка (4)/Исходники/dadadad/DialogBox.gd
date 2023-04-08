extends Control

var dialog = [
	"О, новая душа, погоди не открывай свой грязный рот",
	"Почему? Ну во-первых не вижу причин что-то объеснять что-то жалкому насекомому.",
	"Ну а во-вторых ты всё равно здесь не задержишся, без моей помощи",
	"У тебя может появится вопрос, на подобии:",
	"Зачем же тогда он со мной говорит?",
	"А я и отвечу: верховные правители чистилища уже давно полагаются только на свой \"Третий глаз\", а твоя сила настолько ничтожна, что они не заметят тебя.",
	"Так вот, ты должен принести мне души древних заключенных ,тем самым доказав мне что ты чего-то стоишь.",
	"Всё, иди.....раздражаешь."
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
