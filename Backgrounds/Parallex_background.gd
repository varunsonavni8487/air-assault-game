extends ParallaxBackground

export(int) var speed      # for getting speed variable in Parallax -> Inspector

var offset_scroll=0

func _process(delta):
	offset_scroll +=speed * delta # runs similar spped in all the computers.
	
	set_scroll_offset(Vector2(-offset_scroll,0)) # why - bcz player moving right so background goes left
	