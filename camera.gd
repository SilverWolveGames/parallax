extends Camera2D


@export var target: CharacterBody2D


#func _physics_process(_delta: float) -> void:
	#if target:
		#position.x = target.position.x
