extends TextureProgress


func _ready():
	Events.connect("power_changed", self, "changePower")
	
func changePower(power : int):
	value = power
