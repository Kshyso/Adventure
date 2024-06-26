@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRNightStreet := preload("res://game/rooms/night_street/room_night_street.gd")
# ---- classes

# nodes ----
var NightStreet: PRNightStreet : get = get_NightStreet
# ---- nodes

# functions ----
func get_NightStreet() -> PRNightStreet: return super.get_runtime_room("NightStreet")
# ---- functions

