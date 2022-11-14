extends RigidBody3D

var _prev_global_transform: Transform3D
var linear_vel: Vector3

func _ready():
	_prev_global_transform = global_transform

func _physics_process(delta):
	linear_vel = (global_transform.origin - _prev_global_transform.origin) / delta
	_prev_global_transform = global_transform
