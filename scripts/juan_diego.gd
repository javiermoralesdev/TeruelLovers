extends CharacterBody2D


const SPEED = 300
var is_attacking = false

func _physics_process(_delta):
	var direction: Vector2
	
		
	if not is_attacking:
		direction = Vector2(
			Input.get_axis("left", "right"),
			Input.get_axis("up", "down")
		)
		if direction.length() != 0:
			$JDSprite.play("move")
		else:
			$JDSprite.play("idle")
	else:
		direction = Vector2.ZERO
	
	if direction.x == -1:
		$JDSprite.flip_h = true
		$Sword/SwordHitBox.position.x = -55
	elif direction.x == 1:
		$JDSprite.flip_h = false
		$Sword/SwordHitBox.position.x = 55
		
	if Input.is_action_just_pressed("attack"):
		is_attacking = true
		$JDSprite.play("attack")
		$SwordTimer.start()
		$AttackTimer.start()
		$Sword/SwordHitBox.disabled = false
	
	velocity = direction * SPEED
	
	move_and_slide()


func _on_attack_timer_timeout():
	is_attacking = false
	$Sword/SwordHitBox.disabled = true
