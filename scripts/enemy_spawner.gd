extends Node2D

@export var enemies: Array[PackedScene]

func _ready():
	spawn()

func spawn():
	var index = randi_range(0, enemies.size() -1)
	var enemy_instance = enemies[index].instantiate()
	$EnemyPosition.progress = randi()
	enemy_instance.position = $EnemyPosition.position
	enemy_instance.set_process(false)
	add_child.call_deferred(enemy_instance)


func _on_enemy_timer_timeout():
	spawn()
