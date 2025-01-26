extends RigidBody2D

const SPEED = 400.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var direction = Vector2(-1,1).normalized()
	linear_velocity = direction * SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Paddle"):
		var collision_shape = body.get_node("CollisionShape2D")
		if collision_shape and collision_shape.shape is RectangleShape2D:
			var paddle_size = collision_shape.shape.size
			
			var offset = (global_position.y - body.global_position.y) / paddle_size.y
			linear_velocity = linear_velocity.rotated(offset * 0.25)
	
	if body.is_in_group("Wall"):
		linear_velocity = linear_velocity.rotated(0.05)
		
	linear_velocity = linear_velocity.normalized() * SPEED
