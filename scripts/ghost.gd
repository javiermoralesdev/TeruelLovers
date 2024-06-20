extends Enemy


func _ready():
	type = EnemyType.Sword
	speed = 200


func _on_bat_sprite_animation_finished():
	match $BatSprite.animation:
		"spawn":
			$BatSprite.play("idle")
			moving = true
		"die":
			queue_free()
		"hit":
			moving = true
			$BatSprite.play("idle")

func take_damage(hurtType: EnemyType):
	super.take_damage(hurtType)
	moving = false
	$BatSprite.play("hit")
	if health <= 0:
		call_deferred("disable_collision")
		$BatSprite.play("die")

func _process(delta):
	super._process(delta)
	if not moving:
		return
	$BatSprite.flip_h = targetPos.x > global_position.x

func disable_collision():
	$BatCollision.disabled = true

func _on_body_entered(body):
	super.calculate_death(body)
