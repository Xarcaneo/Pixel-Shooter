extends Control

var path = "res://Gameplay/Levels/Level" + Game.level_selected + ".tscn"
var level = load(path)

onready var level_node: Node2D = get_node("Level")

func _ready():
	if level:
		level_node.add_child(level.instance())
	
