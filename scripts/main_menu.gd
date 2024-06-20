extends Control


func _ready():
	if OS.get_name() == "Web":
		$MainPanel/ExitButton.queue_free()
	
	$MainPanel/ScoreLabel.text = tr("hscore") + ": " + str(GLOBAL.hScore)


func _on_play_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/tutorial.tscn")




func _on_exit_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().quit()


func _on_credits_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/credits.tscn")
