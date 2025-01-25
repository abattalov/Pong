extends CharacterBody2D

const SPEED = 300.0
const PADDLE_HEIGHT = 78
const PADDLE_WIDTH = 24
var screen_size

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	print(screen_size) #1152,648

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_up", "ui_down")
	
	if direction and Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		velocity.y = direction * SPEED
		if position.y > screen_size.y - PADDLE_HEIGHT/2 and Input.is_action_pressed("ui_down") or position.y < PADDLE_HEIGHT/2 and Input.is_action_pressed("ui_up"):
			velocity.y = 0
	else:
		velocity.y = 0
		
	#print(position.y)

	move_and_slide()

