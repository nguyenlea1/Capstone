extends Sprite2D

@export var scroll_speed: float = 20.0  # Adjust this speed as desired

func _process(delta: float) -> void:
	# Move the camera upward
	position.y = scroll_speed * delta
	
	# Reset position for infinite scrolling effect
	if position.y > get_viewport_rect().size.y:
		position.y = -texture.get_size().y
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
