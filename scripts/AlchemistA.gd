extends CharacterBody2D

@onready var interactable: Interactable = $Interactable
@onready var sprite := $AnimatedSprite2D

var vel := 0
var speed := 85
var started := false

func _ready():
	interactable.interact = Callable(self, "_on_interact")
	walk_in()
	
func _on_interact():
	Dialogic.start("test_timeline")
	
func _physics_process(delta):
	if position.x <= 55:
		stop()
		if !started:
			Dialogic.start("tut_entry_timelin")
			started = true
	elif vel > 0 and position.x >= 290:
		queue_free()
	
	velocity.x = vel
	move_and_slide()

func walk_in():
	vel = -speed
	sprite.animation = "left"

func walk_out():
	vel = speed
	sprite.animation = "right"

func stop():
	vel = 0
