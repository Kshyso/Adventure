@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCGuy := preload("res://game/characters/guy/character_guy.gd")
# ---- classes

# nodes ----
var Guy: PCGuy : get = get_Guy
# ---- nodes

# functions ----
func get_Guy() -> PCGuy: return super.get_runtime_character("Guy")
# ---- functions

