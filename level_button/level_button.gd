extends NinePatchRect

const green_texture = preload("res://assets/green_panel.png")

@onready var level_label = $LevelLabel
@onready var check_mark = $CheckMark

var _level_number: String = "99"

# Called when the node enters the scene tree for the first time.
func _ready():
	level_label.text = _level_number
	set_level_beaten(ScoreSync.has_level_score(str(_level_number)))


func set_level_beaten(has_score: bool) -> void:
	if has_score:
		check_mark.show()
	else:
		check_mark.hide()

func set_level_number(level_number: String) -> void:
	_level_number = level_number

func _on_gui_input(event):
	if event.is_action_pressed("select"):
		texture = green_texture
		SignalManager.on_level_selected.emit(_level_number)
