extends Node

func _ready():
	global.sound_controller = self

func _exit_tree():
	global.sound_controller= null 

