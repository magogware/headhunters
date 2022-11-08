extends XRController3D

const GRIP_ACTION := "grip"
const ROCKET_SPEED := 1.0

var origin := get_parent()

func _physics_process(delta):
	var rocket_vector = (get_value(GRIP_ACTION) * ROCKET_SPEED) * -global_transform.basis.z
	origin.global_transform.origin += rocket_vector * delta
