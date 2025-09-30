extends CharacterBody2D



var directionV = Vector2(-8,6)
var rotateG = deg_to_rad(-45)
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.play("idle")
	rotation = rotateG
func _physics_process(delta):
	
	move_and_collide(directionV)
