extends KinematicBody2D

export (int) var vitesse = 200
var velocite = Vector2()
export (PackedScene) var balle
onready var canon = $Canon
onready var nombreVie = get_node("/root/NombreVie")

func _ready():
	position.x = 512
	position.y = 300

func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		velocite = move_and_slide(velocite)
	if nombreVie.NbVie == 0:
		queue_free()
	
func get_input():
	var avance = Input.is_action_pressed("ui_up")
	var shoot = Input.is_action_just_pressed("gauche")
	
	if avance:
		velocite = Vector2(vitesse, 0).rotated(rotation)
	if shoot:
		var b = balle.instance()
		b.creer(canon.global_position, rotation)
		get_parent().add_child(b)


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	var position_x = position.x
	var position_y = position.y
	if (position_x > 1024 and position_y > 0 and position_y < 640):
		position.x = -5
	if (position_x < 0 and position_y > 0 and position_y < 640):
		position.x = 1029
	if (position_x < 1024 and position_y < 0 and position_x > 0):
		position.y = 645
	if (position_x < 1024 and position_y > 640 and position_x > 0):
		position.y = -5
