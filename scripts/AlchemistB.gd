extends CharacterBody2D

@onready var interactable: Interactable = $Interactable
@onready var sprite := $AnimatedSprite2D

var vel := 0
var speed := 40
var started := false

func _ready():
	interactable.interact = Callable(self, "_on_interact")
	Dialogic.signal_event.connect(handle_signal)
	walk_in()
	
func _on_interact():
	#Dialogic.start("test_timeline")
	pass

func _physics_process(delta):
	if !started and position.y >= -40:
		stop()
		started = true
	elif started and position.y <= -140:
		stop()
		sprite.animation = "front"
	
	velocity.y = vel
	move_and_slide()

func handle_signal(argument: String):
	if argument == "tutorial_skipped" or argument == "tutorial_recipes":
		walk_out()

func walk_in():
	vel = speed
	sprite.animation = "front"

func walk_out():
	vel = -speed
	sprite.animation = "back"

func stop():
	vel = 0
