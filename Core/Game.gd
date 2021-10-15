"Main core of the game"
extends Node

onready var scene_loader: Node = get_node("SceneLoader")
onready var save_manager: Node = get_node("SaveManager")
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

var level_selected : String

func scene_transition(scene_path):
	animation_player.play("fade_out")
	scene_loader.change_scene(scene_path)
	animation_player.play("fade_in")
