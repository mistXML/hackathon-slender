extends CharacterBody3D

@onready var nav_agent = $NavAgent/NavigationAgent3D
@onready var player = get_tree().get_current_scene().get_node("Player")
var next_position : Vector3
var speed = 100
var seen : bool
var base_aggressiveness = 1.0
var aggressiveness = base_aggressiveness
const MAX_AGGRESSIVENESS = 10.0
var max_dist = 7
var chase : bool
const TELEPORT_TIMER = 30
var time_to_teleport = TELEPORT_TIMER

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if !chase:
		aggressiveness += 0.001
	if aggressiveness > 10 and global_position.distance_to(player.global_position) <= max_dist:
		speed = 5
		aggressiveness -= 0.01
		max_dist = 0.5
		chase = true
	if chase:
		aggressiveness -= 0.01
		if aggressiveness <= base_aggressiveness:
			aggressiveness = base_aggressiveness
			speed = 100
			chase = false
			max_dist = 7
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	look_at(player.position)
	if (global_position.distance_to(player.global_position) > max_dist) and !seen or chase:
		nav_agent.target_position = player.global_position
		next_position = nav_agent.get_next_path_position()
		velocity = global_position.direction_to(next_position) * speed
		move_and_slide()
	if global_position.distance_to(player.global_position) > 15:
		time_to_teleport -= 1*delta
		if time_to_teleport < 1:
			time_to_teleport = TELEPORT_TIMER
			random_teleport()

func _on_visible_on_screen_notifier_3d_screen_entered() -> void:
	seen = true

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	seen = false

func base_aggressiveness_mult(multiplier):
	base_aggressiveness *= multiplier
	
func add_aggressiveness(val):
	aggressiveness += val
	
func random_teleport():
	global_position = player.position + Vector3(randi_range(5, 20),0,randi_range(5, 20))
