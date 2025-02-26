extends Node

const SCORE_FILE: String = "user://scores.dat"
const NO_BEST: int = 10000

var _best_scores: Dictionary = {
	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	load_scores()

func load_scores() -> void:
	if !FileAccess.file_exists(SCORE_FILE):
		return
	var file = FileAccess.open(SCORE_FILE, FileAccess.READ)
	_best_scores = JSON.parse_string(file.get_as_text())
	print("load_scores():", _best_scores)

func save_scores() -> void:
	var file = FileAccess.open(SCORE_FILE, FileAccess.WRITE)
	file.store_string(JSON.stringify(_best_scores))

func has_level_score(level: String) -> bool:
	return level in _best_scores

func get_level_best_score(level: String) -> int:
	if has_level_score(level):
		return _best_scores[level]
	return NO_BEST

func score_is_new_best(level: String, moves: int) -> bool:
	if !has_level_score(level):
		return true
	if get_level_best_score(level) > moves:
		return true
	return false

func level_complete(level: String, moves: int) -> void:
	if score_is_new_best(level, moves):
		_best_scores[level] = moves
	save_scores()
