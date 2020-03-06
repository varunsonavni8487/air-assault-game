extends Sprite

func _process(delta):
	if global.player != null:
		frame = global.player.health