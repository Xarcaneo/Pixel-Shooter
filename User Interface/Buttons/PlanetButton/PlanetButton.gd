extends TextureButton

const path = "res://Gameplay/LevelSelectScreens/LevelSelectScreen_"
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

func _ready():
	load_data()

func _on_Arrow_left_pressed():
	animated_sprite.frame -= 1

func _on_Arrow_right_pressed():
	animated_sprite.frame += 1

func load_data():
	animated_sprite.frame = Game.save_manager.game_data.current_planet

func save_data():
	Game.save_manager.game_data.current_planet = animated_sprite.frame
	Game.save_manager.save_game()

func _on_PlanetButton_tree_exiting():
	save_data()

func _on_SelectButton_pressed():
	var next_scene_path = path + String(animated_sprite.frame) + ".tscn"
	Game.scene_transition(next_scene_path)
