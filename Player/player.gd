extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -800.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 2.0 * delta

	# Handle jump.
	if Input.is_action_just_pressed(&"jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if velocity.y < 0.0 && Input.is_action_just_released(&"jump"):
		velocity.y *= 0.85

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = lerpf(velocity.x, direction * SPEED, delta * 5.0)
	else:
		velocity.x = lerpf(velocity.x, 0.0, delta * 10.0)

	move_and_slide()
