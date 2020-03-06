extends Sprite

export(int) var health = 1
export(int) var speed = 50
export(int) var point_value = 5

var particles=preload("res://Particles//Enemy_destroy_particles.tscn")

signal instance_node(node,location)

func _ready():
	if global.WORLD!= null:
		connect("instance_node", global.WORLD,"instance_node")

func _process(delta):
	global_position.x -= speed * delta
	
	if health <= 0:
		global.play_sound("Explosion")
		global.score +=point_value
		emit_signal("instance_node",particles,global_position)
		queue_free()
		
	if global_position.x < -20:
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		health -= area.get_parent().damage
		area.get_parent().queue_free() # delete node from gaem
