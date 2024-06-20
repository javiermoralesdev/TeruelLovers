extends Node2D

enum Character{
	ISABEL,
	JUAN_DIEGO
}

@export var isabel: PackedScene
@export var juan_diego: PackedScene

var character = Character.JUAN_DIEGO

func _ready():
	GLOBAL.playing = true
	GLOBAL.score = 0
	%ScoreLabel.text = tr("score") + ": " + str(GLOBAL.score)

func _switch_characters():
	if not GLOBAL.playing:
		return
	character = Character.ISABEL if character == Character.JUAN_DIEGO else Character.JUAN_DIEGO
	match character:
		Character.ISABEL:
			var instance = isabel.instantiate()
			instance.position = get_child(0).position
			get_child(0).queue_free()
			add_child(instance)
		Character.JUAN_DIEGO:
			var instance = juan_diego.instantiate()
			instance.position = get_child(0).position
			get_child(0).queue_free()
			add_child(instance)

func _process(_delta):
	if Input.is_action_just_pressed("switch"):
		_switch_characters()
		
func enemy_dead():
	GLOBAL.score += 1
	%ScoreLabel.text = tr("score") + ": " + str(GLOBAL.score)
	%EnemyTimer.wait_time -= 0.1

func die():
	GLOBAL.playing = false
	if GLOBAL.hScore < GLOBAL.score:
		GLOBAL.hScore = GLOBAL.score
		GameData.save_game()
	%GameOverPanel.spawn()
	get_child(0).queue_free()
