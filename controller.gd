extends XRController3D

const GRIP_ACTION := "grip"
const ROCKET_SPEED := 1.0

var body : RigidBody3D

func _ready():
	body = get_node("../RigidBody3D")

func _physics_process(delta):
	var rocket_vector = (get_value(GRIP_ACTION) * ROCKET_SPEED) * global_transform.basis.z * delta
	var controller_offset = global_transform.origin - body.global_transform.origin
	body.apply_force(rocket_vector, controller_offset)
