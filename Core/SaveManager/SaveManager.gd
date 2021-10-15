extends Node

const dir_path = "user://data/"
const full_path = "user://data/game_data.tres"

export (Script) var game_save_class

var game_data = {
	current_ship = "Nutshell",
	current_planet = 0,
	levels_unlocked = 1
}

func _ready():
	load_game()

func save_game():
	var new_save = game_save_class.new()
	new_save.current_planet = game_data.current_planet
	
	var dir = Directory.new()
	if not dir.dir_exists(dir_path):
		dir.make_dir_recursive(dir_path)	
		
	ResourceSaver.save( full_path , new_save)
	
func load_game():
	var dir = Directory.new()
	if not dir.file_exists(full_path):
		return false
		
	var save = load(full_path)
	
	game_data.current_planet = save.current_planet
