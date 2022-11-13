extends XRController3D

const B_BUTTON_ACTION := "by_button"
const GRIP_ACTION := "grip"
const ROCKET_SPEED := 1.0

var body : RigidBody3D
var rocket_force : Vector3
var braking_force : Vector3

func _physics_process(delta):
	rocket_force = get_value(GRIP_ACTION * ROCKET_SPEED) * -global_transform.basis.z * delta
	braking_force = get_value(B_BUTTON_ACTION) * -body.linear_velocity * delta
