extends Sprite

export(int) var speed = 100
export(int) var damage = 1

 
func _process(delta):
	global_position.x += speed * delta
	
	if global_position.x > 180:
		queue_free()


