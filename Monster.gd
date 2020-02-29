extends Area2D

export var speed : int = 100
export var moveDist : int = 100
 
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist

func _physics_process (delta):
	
	# move to the "targetX" position
	position.x = move_to(position.x, targetX, speed * delta)

	# if we're at our target, move in the other direction
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

# moves "current" towards "to" in an increment of "step"
func move_to (current, to, step):
 
	var new = current
 
	# are we moving positive?
	if new < to:
		new += step
 
		if new > to:
			new = to
	# are we moving negative?
	else:
		new -= step
 
		if new < to:
			new = to
 
	return new

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Monster_body_entered(body):
	if(body.name == "Fire"):
		get_tree().reload_current_scene()

