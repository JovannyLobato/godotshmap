extends Control

var vitality_player = preload("res://witch.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text =  str($"../Witch".vitality)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Label.text =  str($"../Witch".vitality)
