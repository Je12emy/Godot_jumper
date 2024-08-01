extends Node

class_name StateMachine

@export var initial_state : State
var current_state : State
var states : Dictionary = {}

func _ready():
	# The state machine has a bunch of child nodes
	for child in get_children():
		# If the child is an instance of State
		if child is State:
			# Add it to the dict and connect it's signal with the cb
			states[child.name.to_lower()] = child
			child.Transitioned.connect(_on_child_transitioned)
		# If a initial state is set, invoke it's enter method and
		# set it as the current
		if initial_state:
			initial_state._enter()
			current_state = initial_state
	
	
func _process(delta):
	if current_state:
		current_state._update(delta)

func _physics_process(delta):
	if current_state:
		current_state._physics_update(delta)
	
func _on_child_transitioned(source_state: State, new_state_name: String):
	if current_state != source_state:
		return
	var new_state : State = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state._exit()
	new_state._enter()
	current_state = new_state
