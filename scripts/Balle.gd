extends KinematicBody2D

var vitesse = 500
var velocite = Vector2()
onready var Score = get_node("/root/Score")
const asteoride = preload ("res://scenes/Asteroid.tscn")

func creer(pos,dir):
	position = pos
	velocite = Vector2(vitesse,0).rotated(dir)
	

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if collision:
		if collision.collider.get_meta("scale") == 1:
			Score.score += 5
			queue_free()
		elif collision.collider.get_meta("scale") == 2:
			Score.score += 10
			queue_free()
			var x = collision.position.x
			var y = collision.position.y
			spawnAsteoride(x,y)
			spawnAsteoride(x,y)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func spawnAsteoride(x,y):
	#Creer un astéoride et l'ajouter dans la scène
	var asteoride_new = asteoride.instance()
	get_parent().add_child(asteoride_new)
	#Mettre une direction perpendiculaire de la direction du path
	#Mettre une position random
	asteoride_new.scale.x = 1
	asteoride_new.scale.y = 1
	asteoride_new.set_meta("scale",1)
	asteoride_new.position.x = x
	asteoride_new.position.y = y
	asteoride_new.speed
	
	#Mettre la vélociter (Vitese et direction)
	asteoride_new = Vector2(1, 0)

