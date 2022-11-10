extends XROrigin3D

var body: RigidBody3D

func _ready():
	body = get_node("RigidBody3D")
	
func _physics_process(_delta):
	global_transform = body.global_transform
