extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector2(position.x+5, position.y)


func _on_body_entered(body):
	if body.is_in_group("destrayable"):
		body.hit()
		queue_free()
