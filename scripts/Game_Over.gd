extends Node2D
onready var Score = get_node("/root/Score")

onready var point = $Point

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	point.text = "Score : " + str(Score.score)
