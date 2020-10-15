extends KinematicBody2D

onready var nombreVie = get_node("/root/NombreVie")
export (int) var speed = 70
export (int) var asteoride_gros = 0;

var rng = RandomNumberGenerator.new()
var velocite = Vector2(speed, 0)
var direction = rotation + PI / 2
var grosseur = randi()%2+1

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	direction += rng.randf_range(-PI / 4, PI / 4)
	get_node(".").rotation = direction
	get_node(".").scale.x = grosseur
	get_node(".").scale.y = grosseur
	get_node(".").set_meta("scale",grosseur)

func _physics_process(delta):
	var collision = move_and_collide((velocite * delta).rotated(direction))
	if collision:
		queue_free()
		if	collision.collider.name == "Player":
			nombreVie.NbVie -= 1
		queue_free()
		game_over()
	
func game_over():
	if nombreVie.NbVie == 0:
		queue_free()



