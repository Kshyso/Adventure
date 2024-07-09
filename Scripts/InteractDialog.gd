extends Interactable
class_name InteractDialog

@export var dialog_file : DialogueResource
@export var title : String

func interact():
	print("stop")
	player.can_move = false
	DialogueManager.show_dialogue_balloon(dialog_file, title)
	emit_signal("interacted")
