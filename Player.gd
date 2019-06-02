extends KinematicBody2D

export (int) var SPEED = 200
export (int) var GRAVITY = 1000

var velocity = Vector2(1, 0)

var facingRight = true

# Variable indicating where held items start
var tools = 3

func drop():
	if get_child_count() > tools:
		var node = get_child(tools)
		remove_child(node)
		get_parent().add_child(node)
		
		# Position out of way of character
		if FacingRight():
			node.position = position + Vector2(35, 0)
		else:
			node.position = position + Vector2(-35, 0)
	if get_child_count() > tools:
		get_child(tools).show()

func switch():
	if get_child_count() > tools + 1:
		move_child(get_child(tools), tools + 1)
		get_child(tools).show()
		get_child(tools + 1).hide()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var action = Input.is_action_just_pressed("ui_action")
	var drop = Input.is_action_just_pressed("ui_drop")
	var switch = Input.is_action_just_pressed("ui_switch")
	
	if right:
		velocity.x += SPEED
	if left:
		velocity.x -= SPEED
	if action && get_child_count() > tools:
		get_child(tools).action()
	if drop:
		drop()
	if switch:
		switch()
	
	if velocity.x < 0:
		facingRight = false
	if velocity.x > 0:
		facingRight = true
	
	## DO NOT ATTEMPT TO FIX THIS
	$Sprite.set_flip_h(!FacingRight())
	if get_child_count() > tools:
		get_child(tools).get_child(0).set_flip_v(!FacingRight())
		if !FacingRight():
			get_child(tools).set_rotation(PI)
		else:
			get_child(tools).set_rotation(0)
	if get_child_count() > tools + 1:
		get_child(tools + 1).get_child(0).set_flip_v(!FacingRight())
		if !FacingRight():
			get_child(tools + 1).set_rotation(PI)
		else:
			get_child(tools + 1).set_rotation(0)
	## DO NOT ATTEMPT TO FIX THIS

func FacingRight():
	return facingRight

func _physics_process(delta):
	get_input()
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
