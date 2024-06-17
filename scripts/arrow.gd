extends Area2D

var SPEED = 500

func _process(delta):
	var direction = Vector2(
		cos(rotation),
		sin(rotation)
	)
	
	position += direction * SPEED * delta


func _on_destroy_timer_timeout():
	queue_free()
