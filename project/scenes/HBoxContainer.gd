extends HBoxContainer

func _ready():
	Events.connect("power_changed", self, "updateTexture")

func updateTexture(power : int):
	$TextureProgress.value = power
