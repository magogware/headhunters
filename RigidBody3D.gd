extends RigidBody3D

var prev_x: Vector3

func _ready():
	prev_x = global_transform.basis.x

# Called when the node enters the scene tree for the first time.
func _integrate_forces(state):
	print("Angular: " + str(state.angular_velocity.length()) + ", angle diff: " + str(global_transform.basis.x.angle_to(prev_x)))
	prev_x = global_transform.basis.x
	
