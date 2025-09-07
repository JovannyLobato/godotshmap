extends Control

var vitality_player = preload("res://witch.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../Witch".vitality_changed.connect(_on_witch_vitality_changed)
	$Label.text =  str($"../../Witch".vitality)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_witch_vitality_changed():
	var witch = $"../..".get_node_or_null("Witch")
	if witch:
		$Label.text = str($"../../Witch".vitality)
	else:
		$label.text = "dead"
