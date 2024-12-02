extends CharacterBody2D

@export var speed: float = 200.0  # Max speed of the alien

func _ready() -> void:
	add_to_group("alien")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	#move alien horizontally
	position.x += direction * speed * delta # Move the alien left or right
	
# 	Keep the alien within the screen bounds
	var screen_width = get_viewport_rect().size.x
	var alien_width = 221
	position.x = clamp(position.x, alien_width/2, screen_width - alien_width/2)
