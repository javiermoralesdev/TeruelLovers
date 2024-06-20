extends Node

var hScore = 0
var score = 0
var playing = true

func get_distance(a: Vector2, b: Vector2) -> float:
	return (a - b).length()

func _ready():
	hScore = GameData.load_game().hScore
