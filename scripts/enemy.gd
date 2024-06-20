extends Area2D

class_name Enemy

enum EnemyType{
	Arrow, Sword
}

var type = EnemyType.Arrow
var health = 4
var speed = 250
var moving = false
var targetPos = Vector2()

func take_damage(hurtType: EnemyType):
	if hurtType == type:
		health -= 2
	else:
		health -= 1
	
	if health <= 0:
		get_tree().get_nodes_in_group("player")[0].enemy_dead()

func _process(delta):
	if not GLOBAL.playing:
		return
	targetPos = (get_tree().get_nodes_in_group("player")[0]).get_child(0).global_position
	if not moving:
		return
	var distance = targetPos - global_position
	var angle = atan2(distance.y, distance.x)
	var direction = Vector2(cos(angle), sin(angle))
	position += direction * speed * delta

func calculate_death(body):
	if body.is_in_group("jd") or body.is_in_group("isabel"):
		get_tree().get_nodes_in_group("player")[0].die()
