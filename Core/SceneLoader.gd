"Script responsible for scene change"
extends Node

func change_scene(scene_path):
	get_tree().change_scene(scene_path)
