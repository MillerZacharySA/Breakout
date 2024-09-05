extends Area2D

@export var speed = 600
@onready var screensize = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = screensize.x/2
	position.y = screensize.y-6.976-15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "ui_up", "ui_down")
	
	position += input * speed * delta
	position = position.clamp(Vector2(137.024,screensize.y-6.976-15), Vector2(screensize.x-137.024,screensize.y-6.976-15))


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("ball"):
		if global_position.x - area.global_position.x > 41.1072:
			area.velocity.x = -280
			area.velocity.y *= -1.25
		elif global_position.x - area.global_position.x > 13.7024:
			area.velocity.x = -180
			area.velocity.y *= -0.9
		elif global_position.x - area.global_position.x > -13.7024:
			if area.velocity.x <= 70:
				area.velocity.x = 70
			else:
				area.velocity.x = -70
			area.velocity.y *= -0.7
		elif global_position.x - area.global_position.x > -41.1072:
			area.velocity.x = 180
			area.velocity.y *= -0.9
		else:
			area.velocity.x = 280
			area.velocity.y *= -1.25
	
		
