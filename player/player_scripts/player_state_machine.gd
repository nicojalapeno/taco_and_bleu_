class_name PlayerStateMachine extends Node

var states : Array[ State ]
var previous_state : State
var current_state : State


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# No code is going to run until this is enabled
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_state( current_state.process(delta))
	pass

func _physics_process(delta):
	change_state( current_state.physics(delta))
	pass

func _unhandled_input(event):
	change_state( current_state.handle_input(event))
	pass

func initialize( _player: Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)

	if states.size() > 0:
		states[0].player = _player
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state( new_state : State ) -> void:
	if new_state == null || new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	previous_state = current_state
	current_state = new_state
	current_state.enter()
