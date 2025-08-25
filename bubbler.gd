extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
var bubble = preload("res://bubbleTurquesa.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready():
	$AnimatedSprite2D.play("quiet")

func _physics_process(delta):
	pass

func _on_timer_timeout():
	$AnimatedSprite2D.play("spiting")
	
func _on_animated_sprite_2d_animation_finished():
	animation.play("quiet")
	$Timer.wait_time = randf_range(0,8)

func _on_animated_sprite_2d_frame_changed():
	if animation.frame == 4 and animation.animation == "spiting":
		var bubbleInstantiate = bubble.instantiate()
		add_sibling(bubbleInstantiate)
		bubbleInstantiate.position = Vector2(position.x-50,position.y+60)
