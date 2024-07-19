extends CharacterBody2D

var speed := 150
var looking_left := false

@onready var sprite := $AnimatedSprite2D

func _physics_process(delta):
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction[0] > 0:
		sprite.flip_h = false
	elif direction[0] < 0:
		sprite.flip_h = true
		
	velocity = direction * speed
  
	move_and_slide()
