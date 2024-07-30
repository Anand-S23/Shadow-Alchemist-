extends CharacterBody2D

@onready var interactable: Interactable = $Interactable
@onready var sprite := $AnimatedSprite2D

var vel := 0
var speed := 40

func _ready():
	interactable.interact = Callable(self, "_on_interact")
	walk_in()
	
func _on_interact():
	#Dialogic.start("test_timeline")
	pass

func _physics_process(delta):
	if position.y >= -40:
		stop()
	
	velocity.y = vel
	move_and_slide()

func walk_in():
	vel = speed
	sprite.animation = "front"

func walk_out():
	vel = -speed
	sprite.animation = "back"

func stop():
	vel = 0
