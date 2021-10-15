extends Control

onready var grid_container : GridContainer = get_node("GridContainer")

func _ready():
	_unlock_levels()

func _unlock_levels():
	for i in grid_container.get_children():
		if int(i.number) > Game.save_manager.game_data.levels_unlocked:
			i.disable()
			
