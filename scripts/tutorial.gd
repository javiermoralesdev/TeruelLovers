extends Control



func _on_play_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/intro.tscn")
