extends Node2D

@export var blue_candy: PackedScene
@export var green_candy: PackedScene
@export var pink_candy: PackedScene
@export var empty_wrapper: PackedScene
@export var score: int = 0

var items = []  # Array to hold different items
@export var lives = 3
@onready var heart_sprites = [$Heart, $Heart2, $Heart3]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	items.append(blue_candy)
	items.append(green_candy)
	items.append(pink_candy)
	items.append(empty_wrapper)
	$SpawnTimer.start() #Starts the spawning timer
	
# Game Over handling
func game_over() -> void:
	$SpawnTimer.stop()
	$Player.set_process(false) 
	# Load the Game Over scene
	var game_over_scene = preload("res://GameOverPage.tscn").instantiate()
	get_tree().current_scene.add_child(game_over_scene)
	
#spawns candy/food
func on_SpawnTimer_timeout() -> void:
	#Selects random item from the array
	var item_type = items[randi() % items.size()]  # Get a random item type (candy or food)
	var item = item_type.instantiate()
	
	var screen_width = get_viewport_rect().size.x # Size of screen
	var item_width = 88  # sprite width
	item.position.x = clamp(randf() * screen_width, item_width / 2, screen_width - item_width / 2) # Keep sprites within screen size
	item.position.y = 0
	add_child(item)  # Add the candy to the scene
	
# Function to update heart sprites based on lives remaining
func update_hearts() -> void:
	# Heart goes grayscale if lives are less than or equal to current heart's index
	$Heart.set_grayscale(lives < 3)
	$Heart2.set_grayscale(lives < 2)
	$Heart3.set_grayscale(lives < 1)
	
# Call this function each time a taco collision happens
func lose_life() -> void:
	if lives > 0:
		lives -= 1
		update_hearts()
		if lives == 0:
			game_over()  # Call your game over logic here
	
func update_score(points: int) -> void:
	score += points
	$ScoreLabel.text = "Score: %d" % score
