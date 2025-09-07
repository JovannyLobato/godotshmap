extends CharacterBody2D



func _ready():
	$AnimatedSprite2D.play("ray")

func _physics_process(delta):
	pass
func _on_animated_sprite_2d_animation_finished():
	queue_free()
	
func kill():
	pass
	


func _on_animated_sprite_2d_frame_changed():
	if $AnimatedSprite2D.frame == 7:
		$CollisionShape2D.disabled = false


