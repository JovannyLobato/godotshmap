extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var myRay = preload("res://ray_1.tscn")
var speed = 10
var direction = Vector2(randf_range(-1.0,1.0)*speed,
randf_range(-1.0,1.0)*speed)
var collision
var collision_name
var collision_normal = Vector2.ZERO
var last_direction = Vector2.ZERO	
func _ready():
	# var direction = Vector2(randf_range(-1.0,1.0),
	#randf_range(-1.0,1.0)).normalized()
	
	animation.play("walking")
	
	
func _process(delta):
	pass
	"""
	if position.x < 40 :
		velocity = Vector2(0,0)
		animation.play("boom")
	"""	
func _physics_process(delta):
	collision = move_and_collide(direction)	
	if collision:
		collision_normal = collision.get_normal()
		animation.stop()
		print("collisione")
		collision_name = collision.get_collider().name
		last_direction = direction
		direction = Vector2(0,0)
		animation.play("boom")
		
		
func _on_animated_sprite_2d_animation_finished():
	var rayInstance = myRay.instantiate()
	add_sibling(rayInstance)
	rayInstance.global_position = position
	if collision_normal != Vector2.ZERO:
		rayInstance.rotation = last_direction.bounce(collision_normal).angle()
		print("no soy un vector 0")
	else:
		rayInstance.rotation = last_direction.angle()
	
	
	queue_free()
	
