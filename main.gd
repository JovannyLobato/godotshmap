extends Node2D
var bubble = preload("res://bubbleTurquesa.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"""
func _on_timer_timeout():
	var bubbleInstance = bubble.instantiate()
	add_child(bubbleInstance)
	bubbleInstance.position = Vector2(randf_range(240.0,750.0), randf_range(200,600))
"""
