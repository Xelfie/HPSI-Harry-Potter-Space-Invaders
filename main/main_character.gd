extends CharacterBody2D


@export var spell_sprite_scene : PackedScene  # Reference to the SpellSprite scene


const SPEED: float = 300.0


var spells : Array = []  # Array to store multiple spell instances


func _physics_process(delta: float) -> void:
	# Handle movement
	var directionX := Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionY := Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):  # Detect when pressing on Space or Enter
		instantiate_spell_sprite()
		
func instantiate_spell_sprite():
	var spell_instance = spell_sprite_scene.instantiate()  # Create an instance of the sprite scene
	get_parent().add_child(spell_instance)  # Add it to the current scene
	spell_instance.position = position  # Set the position to the character's position

	# Add the new spell instance to the array of spells
	spells.append(spell_instance)
	

func unalive():
	print("Character died!")  
	queue_free()  # Remove character from scene	
