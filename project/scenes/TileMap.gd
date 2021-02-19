extends TileMap


const ShootTarget = preload("res://scenes/ShootTarget.tscn")

func _ready():
	var players = get_used_cells_by_id(2)
	replaceObjects(players, ShootTarget)

func replaceObjects(objects : Array, Instance):
	var tilePos
	for tile in objects:
		var newObject = Instance.instance()
		tilePos = map_to_world(tile)
		newObject.global_position = tilePos
		set_cell(tile.x, tile.y, -1)
		add_child(newObject)
