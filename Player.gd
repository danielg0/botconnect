extends KinematicBody2D

export (int) var SPEED = 200
export (int) var GRAVITY = 1000

var velocity = Vector2()
var facingRight = true

func drop():
	if get_child_count() > 2:
		var node = get_child(2)
		remove_child(node)
		get_parent().add_child(node)
		
		# Position out of way of character
		if facingRight:
			node.position = position + Vector2(35, 0)
		else:
			node.position = position + Vector2(-35, 0)

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var action = Input.is_action_just_pressed("ui_action")
	var drop = Input.is_action_pressed("ui_drop")
	
	if right:
		velocity.x += SPEED
	if left:
		velocity.x -= SPEED
	if action && get_child_count() > 2:
		get_child(2).action()
	if drop:
		drop()
	
	# Check if direction faced changed
	if velocity.x > 0:
		facingRight = true
		if get_child_count() > 2:
			get_child(2).rotation = 0
	if velocity.x < 0:
		facingRight = false
		if get_child_count() > 2:
			get_child(2).rotation = -PI

func FacingRight():
	return facingRight

func _physics_process(delta):
	get_input()
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
