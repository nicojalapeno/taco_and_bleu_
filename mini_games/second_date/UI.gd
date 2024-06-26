extends CanvasLayer

class_name UI

@onready var player_points = $%PlayerPoints
@onready var cpu_points = $%CPUPoints


# Called when the node enters the scene tree for the first time.
func _ready():
	player_points.text = "%d" % 0
	cpu_points.text = "%d" % 0


func update_cpu_points(points: int):
	cpu_points.text = "%d" % points

func update_player_points(points: int):
	player_points.text = "%d" % points
