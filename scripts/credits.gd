extends Control



func _on_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/main_menu.tscn")
