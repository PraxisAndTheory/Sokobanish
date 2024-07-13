extends Control

@onready var moves_label = $MC/NinePatchRect/MarginContainer/VBoxContainer/MovesLabel
@onready var record_label = $MC/NinePatchRect/MarginContainer/VBoxContainer/RecordLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func new_game() -> void:
	hide()
	record_label.hide()

func victory(level: String, moves: int) -> void:
	show()
	moves_label.text = str(moves) + " moves taken!"
	if ScoreSync.score_is_new_best(level, moves):
		record_label.show()
