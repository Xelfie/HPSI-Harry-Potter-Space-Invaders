extends Area2D

signal player_died

const SPEED : float = 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position.x += SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.unalive()
		queue_free()
