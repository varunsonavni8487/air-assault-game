extends Sprite

var bullet = preload("res://Player_bullets//Player_bullet.tscn")

var particles =preload("res://Players_tuff//Player_destroy_particles.tscn")

var can_shoot = true
var health = 3

signal instance_node (node,location)

func _ready():
	global_position.y= get_viewport().get_mouse_position().y
	global.player = self
	

func _exit_tree():       #For exiting when health becomes zero
	global.player = null


func _process(delta):
	
	global_position.y = lerp(global_position.y,get_viewport().get_mouse_position().y,0.2)  #0.2 means how quickly we can go in y axis
	
	if Input.is_action_pressed("shoot") and can_shoot:
		global.play_sound("Shoot")
		emit_signal("instance_node", bullet, global_position)
		$Reload_timer.start()
		can_shoot=false
	
	if health <=0:
		global.play_sound("Explosion")
		emit_signal("instance_node", particles,global_position)
		queue_free()

func _on_Hitbox1_area_entered(area):
	if area.is_in_group("Enemy"):
		global.play_sound("Explosion")
		area.get_parent().queue_free()
		#emit_signal("instance_node",particles,global_position)
		#queue_free()
		health -=1


func _on_Reload_timer_timeout():
	can_shoot=true
	$Reload_timer.stop()
