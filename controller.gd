extends XRController3D

signal grip_release

const GRIP_ACTION := "grip"
const ROCKET_SPEED := 1.0
const DECEL_TIME := 0.2

var prev_grip_value

var body : RigidBody3D
var timer: Timer

func _ready():
	body = get_node("../RigidBody3D")
#	timer = Timer.new()
#	timer.wait_time = DECEL_TIME
#	timer.one_shot = true
#	timer.connect("timeout", _elapsed)
#	connect("grip_release", _grip_released)
#	prev_grip_value = get_value("GRIP_ACTION")
#
#func _grip_released():
#	print("release")
#	body.custom_integrator = true
#	timer.start()
#
#func _elapsed():
#	body.custom_integrator = false

func _physics_process(delta):
#	if prev_grip_value != get_value(GRIP_ACTION) and get_value(GRIP_ACTION) == 0:
#		emit_signal("grip_release")
#		prev_grip_value = 0
#	else:
		prev_grip_value = get_value(GRIP_ACTION)
		var rocket_vector = (get_value(GRIP_ACTION) * ROCKET_SPEED) * global_transform.basis.z * delta
		var controller_offset = global_transform.origin - body.global_transform.origin
		body.apply_force(rocket_vector*0.1, controller_offset)
		body.apply_central_force(rocket_vector)
#		print("vec" + str(rocket_vector) + " val" + str(get_value(GRIP_ACTION) * ROCKET_SPEED))
