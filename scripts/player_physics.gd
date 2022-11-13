extends RigidBody3D

var _prev_global_transform: Transform3D
var linear_velocity: Vector3

func _ready():
	_prev_global_transform = global_transform

func _physics_process(delta):
	linear_velocity = (global_transform.origin - prev_global_transform.origin) / delta
	prev_global_transform = global_transform
