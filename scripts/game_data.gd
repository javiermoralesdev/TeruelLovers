class_name GameData
extends Resource

@export var hScore: int

const path = "user://save_game.tres"

func _init():
	hScore = GLOBAL.hScore
	

static func save_game():
	ResourceSaver.save(GameData.new(), path)
	
static func load_game() -> GameData:
	if ResourceLoader.exists(path):
		return ResourceLoader.load(path) as GameData
	return GameData.new()
