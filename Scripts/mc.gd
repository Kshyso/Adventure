extends CharacterBody2D

@export var speed : float = 200.0

@export var can_move: bool = true  # Flag to control if the player can move

var direction: Vector2
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		#print(event.global_position)
		$NavigationAgent2D.target_position = event.global_position
		#print($NavigationAgent2D.get_next_path_position())

func _physics_process(_delta: float) -> void:
	# Calculate the direction to the target position
	direction = ($NavigationAgent2D.get_next_path_position() - global_position).normalized()
	# Calculate the distance to the target position
	var distance: float = global_position.distance_to($NavigationAgent2D.get_next_path_position())
	
	# Move the character towards the target position at a constant speed
	if distance > 2.0 and can_move:  # Check if we are close enough to the target position
		velocity = direction * speed
		move_and_slide()

	# Optional: print the current position
	#print("Current Position: ", global_position)

func _process(_delta: float) -> void:
	if direction.x > 0:
		$Sprite2D.flip_h = false
	elif direction.x < 0:
		$Sprite2D.flip_h = true
