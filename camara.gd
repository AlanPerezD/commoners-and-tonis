extends Camera3D

# Movement speed variables
var speed: float = 100.0
var fast_speed: float = 250.0
var current_speed: float = speed

# Called every frame
func _process(delta: float) -> void:
	# Adjust speed if Shift is pressed
	if Input.is_action_pressed("ui_shift"):
		current_speed = fast_speed
	else:
		current_speed = speed

	# Create a movement direction vector in global space
	var direction = Vector3.ZERO

	# Move along the world's axes (independent of camera orientation)
	if Input.is_action_pressed("ui_w"):    # W
		direction.z += 1
	if Input.is_action_pressed("ui_s"):  # S
		direction.z -= 1
	if Input.is_action_pressed("ui_a"):  # A
		direction.x += 1
	if Input.is_action_pressed("ui_d"): # D
		direction.x -= 1

	# Normalize the direction to avoid faster diagonal movement
	if direction != Vector3.ZERO:
		direction = direction.normalized()

	# Move the camera in global space (world coordinates)
	global_translate(direction * current_speed * delta)
