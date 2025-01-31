extends Area2D

@export var speed : float = 400

@onready var spell_sound = $SpellSound  # Reference the AudioStreamPlayer node

signal enemy_died


func _ready():
	spell_sound.play()  # Play the spell casting sound!

func _process(delta):
	position.x -= speed * delta  # Move the spell towards the right

	# Check for collisions (overlapping bodies) each frame
	var bodies = get_overlapping_bodies()  # Get all overlapping bodies with this Area2D

func on_collision(area: Area2D) -> void:
		if area.is_in_group("enemies"):  # Check if the body is an enemy
			emit_signal("enemy_died")
			area.queue_free()  # Destroy the enemy or apply damage
			queue_free()  # Destroy the spell
