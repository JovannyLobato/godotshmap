extends CharacterBody2D

signal witch_dead
signal vitality_changed

@onready var animation = $AnimatedSprite2D
var bullet = preload("res://bullet.tscn")
# this is lol
var bubbler = preload("res://bubbler.tscn")
var speed = 700
var vitality = 3
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var hittable = true

func _physics_process(delta):
	var motion = Vector2.ZERO
	if Input.is_action_pressed("w_pressed"):
		motion.y = -speed
	if Input.is_action_pressed("s_pressed"):
		motion.y = speed
	if Input.is_action_pressed("a_pressed"):
		motion.x = -speed
	if Input.is_action_pressed("d_pressed"):
		motion.x = speed
	motion = motion.normalized() * speed * delta
	var collision = move_and_collide(motion)
	if collision: 
		var collider = collision.get_collider()
		if collider.is_in_group("damage_source") and hittable:
			hit(collider)
			
	if Input.is_action_just_pressed("space_pressed"):
		
		var bulletInstance = bullet.instantiate()
		add_sibling(bulletInstance)
		bulletInstance.position = Vector2(position.x+40, position.y-10)
	
		"""
		you can delete that
		var bb = bubbler.instantiate()
		add_sibling(bb)
		bb.position = position
		"""
func _process(delta):
	pass



func _on_timer_timeout():
	hittable = true
	animation.play("quiet")
	set_collision_mask_value(1, true)
	set_collision_mask_value(3, true)


func _on_area_2d_body_entered(body):
	if body.is_in_group("damage_source") and hittable:
		hit(body)

func hit(collider):
	vitality-=1
	hittable = false
	set_collision_mask_value(1, false)
	set_collision_mask_value(3, false)
	animation.play("damage")
	$Timer.start()
	collider.kill()
	emit_signal("vitality_changed")
	if vitality <= 0 :
		emit_signal("witch_dead")

