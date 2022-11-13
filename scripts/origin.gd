extends XROrigin3D

var body: RigidBody3D
var left_hand
var right_hand

func _ready():
	body = get_node("PlayerPhysics")
	left_hand = get_node("LeftHand")
	right_hand = get_node("RightHand")
	left_hand.body = body
	right_hand.body = body

func _physics_process(_delta):
	var braking_force := Vector3.ZERO
	if left_hand.braking_force.length() > 0:
		braking_force = left_hand.braking_force
	elif right_hand.braking_force.length() > 0:
		braking_force = right_hand.braking_force

	var total_force = braking_force if braking_force.length() > 0 else right_hand.rocket_force + left_hand.rocket_force
	body.apply_central_force(total_force)

	global_transform = body.global_transform
