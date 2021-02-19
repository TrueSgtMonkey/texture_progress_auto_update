extends TextureProgress

func _ready():
	Events.connect("power_changed", self, "changePower")

func changePower(power : int):
	self.value = power
