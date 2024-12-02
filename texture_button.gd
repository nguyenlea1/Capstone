extends TextureButton  

var next_scene_path = "res://goodbye.tscn"

func _ready() -> void:
	# Connect the pressed signal to your function
	self.pressed.connect(_on_pressed)  # Connect the signal here

func _on_pressed() -> void:
	print("Button pressed! Loading goodbye scene.")
	var next_scene = ResourceLoader.load(next_scene_path)  # Load the scene
	if next_scene:
		get_tree().change_scene_to(next_scene)  # Change to the loaded scene
	else:
		print("Failed to load the scene!")
