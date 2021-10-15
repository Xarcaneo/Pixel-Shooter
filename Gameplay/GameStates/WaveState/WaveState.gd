extends state

func _ready():
	state = INACTIVE
		
func _physics_process(delta):
	if state == INACTIVE:
		pass
	elif state == START:
		_set_wave_active()
	elif state == ACTIVE:
		_check_state()
	elif state == DONE:
		queue_free()

func _set_wave_active():
	for child in get_children():
		child.set_active()
	
	state = ACTIVE

func _check_state():
	if get_child_count() <= 0:
		state = DONE

func start_wave():
	if state == INACTIVE:
		state = START
