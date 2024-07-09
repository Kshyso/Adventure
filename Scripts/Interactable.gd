extends Area2D
class_name Interactable

signal interacted

# Common properties
@export var interactable: bool = true
@export var highlight_on_hover: bool = true
@onready var player: CharacterBody2D = $"../../MC"
var waiting_for_player: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.input_event.connect(_on_input_event)
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)

func _on_dialogue_manager_dialogue_ended(_resource: DialogueResource) -> void:
	print("move")
	player.can_move = true

# Signal handler for input events
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and interactable:
		if player:
			if player.global_position.distance_to(global_position) <= 20:
				interact()
			else:
				print("Player needs to approach the object.")
				waiting_for_player = true

# Method to be overridden by subclasses
func interact() -> void:
	print("Base interaction")
	emit_signal("interacted")

# Optional: Highlight on hover
func _on_mouse_entered() -> void:
	if highlight_on_hover:
		$"../Sprite2D".modulate = Color(2, 2, 2)  # Example highlight color
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited() -> void:
	$"../Sprite2D".modulate = Color(1, 1, 1)  # Reset color
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _process(_delta) -> void:
	if waiting_for_player and player:
		if player.global_position.distance_to(global_position) <= 20:
			interact()
			waiting_for_player = false
