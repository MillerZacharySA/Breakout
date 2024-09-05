extends Node2D

#var CorrectSound = preload("res://")
var brick = preload("res://brick.tscn")

# Called when the node enters the scene tree for the first time.	
func _ready() -> void:
	spawn_bricks()
	$Ball.position.x = get_viewport_rect().size.x/2
	$Ball.position.y = get_viewport_rect().size.y/2
	  
func _process(float) -> void:
	#if !$AudioStreamPlayer2D.is_playing():
		#$AudioStreamPlayer2D.stream = CorrectSound
		#$AudioStreamPlayer2D.play()
		pass	
	
func spawn_bricks():
	for x in 9:
		for y in 4:
			var e = brick.instantiate()
			var pos = Vector2(x * (143.104) + 24, y * 38.016 + 19.008)
			add_child(e)
			e.position = pos
