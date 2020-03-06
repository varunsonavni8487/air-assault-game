extends Node # in all node its get preloaded so knoww as global

var WORLD =null 

var player =null # for player health

var sound_controller=null # for sound

var score = 0 



func play_sound(sound):
	if sound_controller != null:
		if sound_controller.has_node(sound):
			sound_controller.get_node(sound).play()
