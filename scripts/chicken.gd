extends Enemy


func _ready():
	type = EnemyType.Arrow
	speed = 200
	moving = true


func _on_bat_sprite_animation_finished():
	match $BatSprite.animation:
		"hit":
			moving = true
			$BatSprite.play("idle")
			if health <= 0:
				call_deferred("disable_collision")
				queue_free()

func take_damage(hurtType: EnemyType):
	super.take_damage(hurtType)
	moving = false
	$BatSprite.play("hit")
	

func _process(delta):
	super._process(delta)
	if not moving:
		return
	$BatSprite.flip_h = targetPos.x > global_position.x

func disable_collision():
	$BatCollision.disabled = true

func _on_body_entered(body):
	super.calculate_death(body)
