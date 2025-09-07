extends Node
enum GameState {PLAYING, GAME_OVER, RETRY}

var current_state = null
var state_nodes = {
	GameState.PLAYING: preload("res://ui.tscn"),
	GameState.GAME_OVER: preload("res://game_over_ui.tscn"),
	GameState.RETRY: preload("res://retry_ui.tscn")
}

var current_node = null

func set_state(new_state):
	if current_node:
		current_node.queue_free()
	
	current_node = state_nodes[new_state].instantiate()
	add_child(current_node)
	current_state = new_state

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_witch_witch_dead():
	pass # Replace with function body.
