extends Node

var multimesh := MultiMesh.new()
var positions: Array = []
var numOfParticles = 200
var size_of_particles = 6 # 6
var color_of_particles = Color(0.4,0.6,0.3)
var sz_screen = Vector2(1920,1000)
# multimesh node
@onready var mmi = MultiMeshInstance2D.new()
func _ready():
	mmi.z_index = 100
	add_child(mmi)
	
	# multimesh configuration
	multimesh.transform_format = MultiMesh.TRANSFORM_2D
	multimesh.instance_count = numOfParticles
	mmi.multimesh = multimesh
	multimesh.use_colors = true
	
	var mesh = QuadMesh.new()
	mesh.size = Vector2(size_of_particles, size_of_particles)
	
	
	
	mmi.multimesh = multimesh
	mmi.multimesh.mesh = mesh
	for i in range(multimesh.instance_count):
		var pos = Vector2(sz_screen.x + randf() * sz_screen.x, randf() * sz_screen.y)
		positions.append(pos)
		var xform = Transform2D(0, pos)
		multimesh.set_instance_transform_2d(i, xform)
		multimesh.set_instance_color(i, color_of_particles)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(multimesh.instance_count):
		positions[i].x -= 400 * delta
		positions[i].y += 10 * delta
		if positions[i].x < 0:
			positions[i].x = sz_screen.x
			positions[i].y = randf() * sz_screen.y
		var xform = Transform2D(0, positions[i])
		multimesh.set_instance_transform_2d(i, xform)
		
	
func addParticle():
	var mic = multimesh.instance_count
	multimesh.instance_count += 10
	var pos = Vector2(sz_screen.x + randf() * sz_screen.x, randf() * sz_screen.y)
	for i in 10:
		positions.append(pos)
		var xform = Transform2D(0, pos)
		multimesh.set_instance_transform_2d(mic, xform)
		multimesh.set_instance_color(mic, color_of_particles)
	
