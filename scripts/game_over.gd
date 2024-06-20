extends ColorRect




func _on_retry_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/game.tscn")
	

func spawn():
	$GameOverScreen/ScoreLabel.text = tr("score") + ": " + str(GLOBAL.score)
	$GameOverScreen/HScoreLabel.text = tr("hscore") + ": " + str(GLOBAL.hScore)
	$AnimationPlayer.play("fade_in")


func _on_main_menu_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/main_menu.tscn")
