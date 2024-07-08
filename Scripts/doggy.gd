extends InteractComponent

var dialogue: String = "I am doggy dog!"

func interact():
	print(dialogue)
	emit_signal("interacted")
