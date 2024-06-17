extends CharacterBody2D

@export var arrowPrefab: PackedScene

const SPEED = 350
var is_attacking = false

func _physics_process(_delta):
	var direction: Vector2
	
		
	if not is_attacking:
		direction =Vector2(
			Input.get_axis("left", "right"),
			Input.get_axis("up", "down")
		)
		if direction.length() != 0:
			$IsabelSprite.play("move")
		else:
			$IsabelSprite.play("idle")
		
		if direction.x == -1:
			$IsabelSprite.flip_h = true
		elif direction.x == 1:
			$IsabelSprite.flip_h = false
	else:
		direction = Vector2.ZERO
		
	if Input.is_action_just_pressed("attack"):
		is_attacking = true
		$IsabelSprite.play("shoot")
		$AttackTimer.start()
		if get_viewport().get_mouse_position().x < position.x:
			$IsabelSprite.flip_h = true
		else:
			$IsabelSprite.flip_h = false
	
	velocity = direction * SPEED
	
	move_and_slide()


func _on_attack_timer_timeout():
	is_attacking = false
	var mousePos = get_viewport().get_mouse_position()
	var lookDir = mousePos - position
	var angle = atan2(lookDir.y, lookDir.x)
	var arrow_instance = arrowPrefab.instantiate()
	arrow_instance.rotation = angle
	arrow_instance.position = position
	get_tree().root.add_child(arrow_instance)
