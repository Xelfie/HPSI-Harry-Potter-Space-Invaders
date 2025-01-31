extends Node2D

@export var enemy_scene : PackedScene  # Enemy scene to instantiate
@export var number_of_enemies : int = 7  # Number of enemies to spawn
@export var spawn_x_position : float = -10  # X position where the enemies will spawn
@export var spawn_y_range : Vector2 = Vector2(-55, 850)  # Y range for vertical spawning (from top to bottom)


@onready var death_sound = $Enemies/GoodbyeBadGuy  # Reference the AudioStreamPlayer node

var enemies : Array = []
var numColumns : int = 5

func _ready():
	for n in numColumns:
		spawn_enemies_vertically(n)
			

# Function to spawn enemies in a vertical line
func spawn_enemies_vertically(column):
	var y_step = (spawn_y_range.y - spawn_y_range.x) / (number_of_enemies - 1)  # Space out enemies evenly
	
	for i in range(number_of_enemies):
		var enemy_instance = enemy_scene.instantiate()  # Create an instance of the enemy scene
		var spawn_y = spawn_y_range.x + i * y_step  # Calculate Y position for each enemy

		# Set the spawn position
		enemy_instance.position = Vector2(spawn_x_position * column * 10, spawn_y)

		# Add the enemy to the scene
		add_child(enemy_instance)
		

		enemies.append(enemy_instance)
