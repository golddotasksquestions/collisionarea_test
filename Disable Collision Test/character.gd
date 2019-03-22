extends KinematicBody2D

onready var sprite = get_node("Sprite")
onready var label = get_node("Label")
onready var collpol = get_node("attack_Area2D/CollisionPolygon2D")
onready var attarea = get_node("attack_Area2D")
onready var attack123_combo = get_node("attack123_combo")
onready var anim = get_node("AnimationPlayer")

var speed = 150
var movedir = Vector2()
var lastinput = "down"

var gotosecond = 0.0
var state = "default"


func _ready():
	pass # Replace with function body.


func _process(_delta):
	#print (state)
	var labeltext = str("monitoring: ",attarea.monitoring)
	label.set_text(labeltext)
	if attarea.monitoring == true:
		sprite.modulate = Color(1,0,0)
	else:
		sprite.modulate = Color(1,1,1)
	
	match state:
		"default":
			state_default() 
		"attack":
			state_attack()

func state_default():
	
	
	if Input.is_action_just_pressed("ui_accept"):
		state = "attack"
		
	controls_loop()
	movement_loop()
	

	
func controls_loop():
	if Input.is_action_pressed("ui_left"):
		lastinput = "left"
		
	if Input.is_action_pressed("ui_right"):
		lastinput = "right"
		
	if Input.is_action_pressed("ui_up"):
		lastinput = "up"
		
	if Input.is_action_pressed("ui_down"):
		lastinput = "down"


	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	#print(LEFT,RIGHT,UP,DOWN," -- ", lastinput)
	
	
	
func movement_loop():
	var motion = movedir.normalized() * speed
	move_and_slide(motion, Vector2(0,0))
	
func playanimation(animation):
	#var starttime = float(gotosecond)
	var newanim = str(animation,lastinput)
	if anim.current_animation !=newanim:
		anim.play(newanim)
		#anim.seek (starttime)
		gotosecond = 0
	else:
		gotosecond = 0

func play_attack_animation(animation):
	#var starttime = float(gotosecond)
	var newanim = str(animation)
	if attack123_combo.current_animation !=newanim:
		attack123_combo.play(newanim)
		#anim.seek (starttime)
		gotosecond = 0
	else:
		gotosecond = 0


func state_attack():
	playanimation("attack_")
	play_attack_animation("combo_timing")

func first_start_waiting_for_input(): 
	print("<---first_start_waiting_for_input()")

func first_end_waiting_for_input():
	print("first_end_waiting_for_input()--->")
	

func second_start_waiting_for_input():
	print("<---second_start_waiting_for_input()")

func second_end_waiting_for_input():
	print("second_end_waiting_for_input()--->")

func fist_combopart_finished():
	print("fist_combopart_finished()")

func second_combopart_finished():
	print("second_combopart_finished")

func third_combopart_finished():
	print("third_combopart_finished")
	print("------------------------------------------------------")
	state = "default"





