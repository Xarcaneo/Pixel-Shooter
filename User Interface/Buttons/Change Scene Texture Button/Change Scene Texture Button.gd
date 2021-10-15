tool
extends TextureButton

export(String, FILE) var next_scene_patch: = ""

func _on_Change_Scene_Texture_Button_pressed():
	Game.scene_transition(next_scene_patch)

func _get_configuration_warning():
	return "next_scene_patch must be set for the button to work" if next_scene_patch == "" else ""
