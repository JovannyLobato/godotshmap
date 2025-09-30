extends CharacterBody2D
@onready var animation = $AnimatedSprite2D
var bubble = preload("res://bubbleTurquesa.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var life = 1
func _ready():
	$AnimatedSprite2D.play("quiet")

func _physics_process(delta):
	pass

func _on_timer_timeout():
	$AnimatedSprite2D.play("spiting")
	
func _on_animated_sprite_2d_animation_finished():
	animation.play("quiet")
	$Timer.wait_time = randf_range(4,15)

func _on_animated_sprite_2d_frame_changed():
	if animation.frame == 4 and animation.animation == "spiting":
		for i in 3:
			var bubbleInstantiate = bubble.instantiate()
			bubbleInstantiate.position = Vector2(position.x-50,position.y+60)
			add_sibling(bubbleInstantiate)
			
		
func hit():
	life-=1;
	if(life<=0):
		queue_free()
		
