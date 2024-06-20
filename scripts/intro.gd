extends Node2D

var finished = false

func on_intro_finished():
	finished = true
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file.call_deferred("res://scenes/game.tscn")

func pause_anim():
	$AnimationPlayer.pause()
	
func _process(_delta):
	if Input.is_action_pressed("attack") and not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("intro")


func _on_button_pressed():
	on_intro_finished()
