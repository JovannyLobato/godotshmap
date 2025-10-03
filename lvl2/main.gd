extends Node2D
var pinguin = preload("res://lvl2/pinguin_duck.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI_state_machine.set_state($UI_state_machine.GameState.PLAYING)
	
	var pinguinInstance = pinguin.instantiate()
	pinguinInstance.position = Vector2(1800,0)
	add_child(pinguinInstance)
	var pinguinInstance2 = pinguin.instantiate()
	pinguinInstance2.position = Vector2(1600,0)
	add_child(pinguinInstance2)
	var pinguinInstance3 = pinguin.instantiate()
	pinguinInstance3.position = Vector2(2000,-200)
	add_child(pinguinInstance3)
	
	


func _process(delta):
	pass
