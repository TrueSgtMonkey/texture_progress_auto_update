extends Node2D

const Shot = preload("res://scenes/Shot.tscn")

var velocity := Vector2()
var power := 0
var weakShot := false

func _ready():
	$Timer.connect("timeout", self, "count")
	global_position += $ShotMarker.get_rect().size / 2.0

func _input(event):
	if !Globals.shot:
		$Target.global_position = get_global_mouse_position()
		if event.is_action_pressed("shoot"):
			$Timer.autostart = true
			$Timer.start()
		if event.is_action_released("shoot"):
			$Timer.autostart = false
			$Timer.stop()
			createShot()

func createShot():
	var shotInstance = Shot.instance()
	velocity = ($Target.global_position - global_position).normalized() * power * 500
	if weakShot:
		velocity *= 0.75
	shotInstance.setVelocity(velocity)
	shotInstance.global_position = global_position
	get_parent().add_child(shotInstance)
	weakShot = false
	setPower(0)
	Globals.shot = true
	
func setPower(power):
	self.power = power
	Events.emit_signal("power_changed", power)

func count():
	setPower(power + 1)
	if weakShot:
		setPower(1)
	if(power == 9):
		setPower(1)
		weakShot = true
