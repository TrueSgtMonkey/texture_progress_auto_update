extends KinematicBody2D

const ZoomOutCam = preload("res://scenes/ZoomOutCam.tscn")

var velocity := Vector2()
var friction := Vector2()

func _physics_process(delta):
	move_and_slide(velocity)
	velocity += friction
	if velocity.length() < 0.01:
		set_physics_process(false)
		$Camera2D.current = false
		var zoomCam = ZoomOutCam.instance()
		zoomCam.global_position = global_position
		get_parent().add_child(zoomCam)
	var slides = get_slide_count()
	for slide in slides:
		var touched = get_slide_collision(slide)
		setVelocity(((velocity.normalized() + touched.normal) / 2.0) * velocity.length() * 2.0)
	$Camera2D.zoom += (Vector2(velocity.length(), velocity.length()) / 500) / 1000
	if $Camera2D.zoom.length() < Vector2(1,1).length():
		$Camera2D.zoom = Vector2(1,1)

func setVelocity(vel : Vector2):
	velocity = vel
	friction = -vel * 0.005
