extends CharacterBody2D

var s_directionV = Vector2(-12,8)
var directionV 
#var rotateG = deg_to_rad(-45)
var rotateG
var onTimerStarted = false
var pos
var left_to_right = false

enum GameState {idle, moving}
var current_state = null


var scSize = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"),
ProjectSettings.get_setting("display/window/size/viewport_height") )

func _ready():
	directionV = s_directionV
	rotateG = directionV.angle() - deg_to_rad(180)
	
	$AnimatedSprite2D.play("idle")
	rotation = rotateG
	pos = position
	
func _physics_process(delta):
	# aqui se controla cuando sale de pantalla
	if(!onTimerStarted and  (position.y>scSize.y || position.y<0 )):
		print("bandera")
		$restartTimer.start()
		onTimerStarted = true

	move_and_collide(directionV)
	
func set_state(new_state):
	current_state = new_state
	
func _on_restart_timer_timeout():
	$restartTimer.stop()
	onTimerStarted = false
	if(position.y<scSize.y):
		print("taco")
		position = pos
		directionV = s_directionV
		rotation = rotateG
		rotateG = directionV.angle() - deg_to_rad(180)
		$AnimatedSprite2D.play("idle")
		$AnimatedSprite2D.flip_h=true
	
	elif(position.y>0):
		print("perro")
		if !left_to_right:
			directionV = Vector2(-s_directionV.x,-s_directionV.y)
		position = Vector2(pos.x-1400,scSize.y)
		rotateG = directionV.angle() - deg_to_rad(180)
		$AnimatedSprite2D.play("flying")
		$AnimatedSprite2D.flip_v = true
		if $AnimatedSprite2D.flip_h:
			$AnimatedSprite2D.flip_h = false
		rotation = rotateG
		
	
