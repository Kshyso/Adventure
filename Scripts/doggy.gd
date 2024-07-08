extends InteractComponent

func interact():
	DialogueManager.show_dialogue_balloon(load("res://Dialogues/Test.dialogue"), "doggy")
	emit_signal("interacted")
