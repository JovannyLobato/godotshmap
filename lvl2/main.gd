extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI_state_machine.set_state($UI_state_machine.GameState.PLAYING)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
