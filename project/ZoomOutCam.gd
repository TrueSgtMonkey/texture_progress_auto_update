extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "stop")

func stop():
	Globals.shot = false
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
