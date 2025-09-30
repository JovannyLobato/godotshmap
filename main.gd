extends Node2D
var bubble = preload("res://bubbleTurquesa.tscn")
var numParticles = 500
var addParticles = false
var game_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$UI_state_machine.set_state($UI_state_machine.GameState.PLAYING)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = 25
	if addParticles and numParticles:
		print("add particles")
		$snow_particles_mmi.addParticle()
		numParticles -= 1
		if numParticles % x == 0:
			if x > 5: 
				x-=1
			$snow_particles_mmi.mmi.multimesh.mesh.size += Vector2(2,2)
		
	if addParticles and numParticles <= 0:
		addParticles = false
		$Timer2.start()
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
	
	if !game_over and get_tree().get_nodes_in_group("damage_source").size() <= 0:
		game_over = true
		addParticles = true
		#$Witch.queue_free()
		$UI_state_machine.set_state($UI_state_machine.GameState.GAME_OVER)

func _on_pasar_de_nivel():
	get_tree().change_scene_to_file("res://lvl2/main.tscn")


func _on_timer_2_timeout():
	$Witch.queue_free()
	_on_pasar_de_nivel()
