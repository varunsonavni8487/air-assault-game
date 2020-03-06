extends Node2D

func _ready():
	global.WORLD = self
	
func _exit_tree():
	global.WORLD= null


func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location


