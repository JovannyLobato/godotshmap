extends Node2D
var bubble = preload("res://bubbleTurquesa.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI_state_machine.set_state($UI_state_machine.GameState.PLAYING)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"""
func _on_timer_timeout():
	var bubbleInstance = bubble.instantiate()
	add_child(bubbleInstance)
	bubbleInstance.position = Vector2(randf_range(240.0,750.0), randf_range(200,600))
"""


func _on_witch_witch_dead():
	$Witch.queue_free()
	$UI_state_machine.set_state($UI_state_machine.GameState.RETRY)



func _on_level_cleaned_timeout():
	if get_tree().get_nodes_in_group("damage_source").size() <= 0:
		$Witch.queue_free()
		$UI_state_machine.set_state($UI_state_machine.GameState.GAME_OVER)
