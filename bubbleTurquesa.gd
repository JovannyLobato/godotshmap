extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var myRay = preload("res://ray_1.tscn")
var speed = 800
var direction = Vector2(randf_range(-1.0,0),
randf_range(-1.0,1.0)).normalized()
var collision
var collision_name
var collision_normal = Vector2.ZERO
var last_direction = Vector2.ZERO
var is_dead = false

func _ready():
	animation.play("walking")
	
func _process(delta):
	pass
	
func _physics_process(delta):
	if is_dead:
		return
	collision = move_and_collide(direction * speed * delta)	
	if collision:
		var collider = collision.get_collider()
		if collider.collision_layer & (1 << 1):
			speed = 0
			collision_normal = collision.get_normal()
			animation.stop()
			collision_name = collision.get_collider().name
			last_direction = direction
			direction = Vector2(0,0)
			animation.play("boom")
		elif collider.collision_layer & (1 << 4):
			kill()
		
func _on_animated_sprite_2d_animation_finished():
	queue_free()

func _on_animated_sprite_2d_frame_changed():
	
	if animation.frame == 5:
		if is_dead:
			queue_free()
			return
		var rayInstance = myRay.instantiate()
		add_sibling(rayInstance)
		rayInstance.global_position = position
		if collision_normal != Vector2.ZERO:
			rayInstance.rotation = last_direction.bounce(collision_normal).angle()

		else:
			rayInstance.rotation = last_direction.angle()
func kill():
	is_dead = true
	animation.play("boom")
	


