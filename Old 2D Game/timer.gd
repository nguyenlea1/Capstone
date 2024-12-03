extends Timer

var food1= preload("res://carrot.tscn")
var food2= preload("res://pumpkin.tscn")


func _on_timeout() -> void:
	randomize() 
	var foods = [food1, food2]# Replace with function body
	var kinds = foods[randi()%foods.size()]
	var food = kinds.instance()
	food.position = Vector2(randi_range(10,990), randi_range(10,590))
	add_child(food)
	wait_time = randi_range(0,1)
