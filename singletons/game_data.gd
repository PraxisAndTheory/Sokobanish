extends Node

const LEVEL_DATA_PATH: String = "res://data/level_data.json"
const TILE_SIZE: int = 32

var _level_data: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	load_level_data()

func load_level_data() -> void:
	var file = FileAccess.open(LEVEL_DATA_PATH, FileAccess.READ)
	_level_data = JSON.parse_string(file.get_as_text())
	pass

func get_data_for_level(level_num: String) -> Dictionary:
	#add protection for invalid level_num later
	return _level_data[level_num]
