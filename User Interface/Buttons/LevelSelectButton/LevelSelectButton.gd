extends TextureButton

const path = "res://Gameplay/Gameplay Screen/GameplayScreen.tscn"

export var number: String

onready var label : Label = get_node("Label")
onready var locked_sprite : TextureRect = get_node("LockedSprite")
func _ready():
	label.text = number

func _on_LevelSelectButton_pressed():
	Game.level_selected = number
	Game.scene_transition(path)

func disable():
		disabled = true
		locked_sprite.visible = true
		label.visible = false
