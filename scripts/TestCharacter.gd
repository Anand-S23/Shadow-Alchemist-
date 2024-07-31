extends CharacterBody2D

@onready var interactable: Interactable = $Interactable
@onready var sprite := $AnimatedSprite2D

var vel := 0
var speed := 85
var started := false

func _ready():
	interactable.interact = Callable(self, "_on_interact")
	Dialogic.signal_event.connect(handle_signal)
	walk_in()
	
func _on_interact():
	pass
	
func _physics_process(delta):
	if !started and position.x <= 55:
		stop()
		Dialogic.start("tut_entry_timelin")
		started = true
	elif started and position.x >= 270:
		stop()
		sprite.animation = "default"
	
	velocity.x = vel
	move_and_slide()

func handle_signal(argument: String):
	if argument == "tutorial_skipped" or argument == "tutorial_recipes":
		walk_out()

func walk_in():
	vel = -speed
	sprite.animation = "left"

func walk_out():
	vel = speed
	sprite.animation = "right"

func stop():
	vel = 0
