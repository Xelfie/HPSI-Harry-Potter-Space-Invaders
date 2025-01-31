extends Node2D


@onready var death_sound = $Enemies/GoodbyeBadGuy  # Reference the AudioStreamPlayer node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().connect("node_added", Callable(self, "_on_new_node"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_node(node):
	if node.is_in_group("spells"):  # Make sure all spells connect when spawned
		node.enemy_died.connect(play_enemy_death_sound)

func play_enemy_death_sound() :
	print("playing sound") 
	death_sound.pitch_scale = randf_range(0.9, 1.1)  # Slightly randomize pitch to prevent overlap issues
	death_sound.play()
