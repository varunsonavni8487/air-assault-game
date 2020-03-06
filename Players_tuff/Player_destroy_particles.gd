extends CPUParticles2D



func _on_Timer_timeout():
	global.score=0
	get_tree().change_scene("res://UI/Title_screen/Title_screen.tscn")