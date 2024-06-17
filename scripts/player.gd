extends Node2D

enum Character{
	ISABEL,
	JUAN_DIEGO
}

@export var isabel: PackedScene
@export var juan_diego: PackedScene

var character = Character.JUAN_DIEGO

func _switch_characters():
	character = Character.ISABEL if character == Character.JUAN_DIEGO else Character.JUAN_DIEGO
	match character:
		Character.ISABEL:
			var instance = isabel.instantiate()
			instance.position = get_child(0).position
			remove_child(get_child(0))
			add_child(instance)
		Character.JUAN_DIEGO:
			var instance = juan_diego.instantiate()
			instance.position = get_child(0).position
			remove_child(get_child(0))
			add_child(instance)

func _process(_delta):
	if Input.is_action_just_pressed("switch"):
		_switch_characters()
