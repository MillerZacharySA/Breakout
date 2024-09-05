extends Area2D

@export var speed = 300
@onready var screensize = get_viewport_rect().size
var velocity = Vector2(speed, speed)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	if position.x <= 22 or position.x >= screensize.x-22:
		velocity.x *= -1
	if position.y <= 22:
		velocity.y *= -1
		
	if velocity.y > 300:
		velocity.y = 300
	if velocity.y < -300:
		velocity.y = -300
		
	if abs(velocity.y) < 125:
		if velocity.y >= 0:
			velocity.y = 125
		else:
			velocity.y = -125
		
	position += velocity * delta
	position = position.clamp(Vector2(22, 22), Vector2(screensize.x-22, 1000000))


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bricks"):
		area.explode()
