extends Node2D

@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Node2D/trees.motion_offset.x -= speed*16 * delta
	$Node2D/clouds.motion_offset.x -= speed * delta
	$Node2D/sean.motion_offset.x -= 0.2 * speed * delta
	
