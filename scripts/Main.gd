extends Node
var simultaneous_scene = preload("res://scenes/Game_Over.tscn").instance()
const asteoride = preload ("res://scenes/Asteroid.tscn")
onready var Score = get_node("/root/Score")
onready var nombreVie = get_node("/root/NombreVie")
onready var vie = $Vie
onready var score = $Score
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vie.text = "Vie : " + str(nombreVie.NbVie)
	score.text = "Vie : " + str(Score.score)
	if nombreVie.NbVie <= 0:
		game_over()

func _on_Timer_timeout():
	#Creer un astéoride et l'ajouter dans la scène
	var asteoride_new = asteoride.instance()
	add_child(asteoride_new)
	
	var coter = randi()%4+1
	var random_spawn_x = randi()%1024
	var random_spawn_y = randi()%640
	#Haut de l'écran
	if coter == 1:
		asteoride_new.position.x = random_spawn_x
		asteoride_new.position.y = 0
	#Côter droit de l'écran
	if coter == 2:
		asteoride_new.position.x = 1024
		asteoride_new.position.y = random_spawn_y
	#Bas de l'écran
	if coter == 3:
		asteoride_new.position.x = random_spawn_x
		asteoride_new.position.y = 640
	#Côter gauche de l'écran
	if coter == 4:
		asteoride_new.position.x = 0
		asteoride_new.position.y = random_spawn_y

	#Ajouter un random dans la direction
	var direction = asteoride_new.rotation + PI /2
	direction += rand_range(-PI / 4, PI / 4)
	asteoride_new = direction

	#Mettre la vélociter (Vitese et direction)
	asteoride_new = Vector2(1, 0)
	asteoride_new = asteoride_new.rotated(direction)
	
func new_game():
	$TimerSpawn.start()

func game_over():
	$TimerSpawn.stop()
	get_tree().get_root().add_child(simultaneous_scene)

