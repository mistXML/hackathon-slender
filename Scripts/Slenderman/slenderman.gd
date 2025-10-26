extends CharacterBody3D

@onready var nav_agent = $NavAgent/NavigationAgent3D
@onready var player = get_tree().get_current_scene().get_node("Player")
@onready var color_rect = get_tree().get_current_scene().get_node("CanvasLayer/ColorRect")
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
var max_distance := 10.0 #we can adjust the required distance and stuff
var min_transparency := 0.0
var max_transparency := 8.0
var dist
@onready var sound = preload("res://Assets/Audio/static.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer3D.stream = sound

func _process(delta: float) -> void:
	dist = global_position.distance_to(player.global_position)
	if !chase:
		aggressiveness += 0.005
	if aggressiveness > 10 and dist <= max_dist:
		speed = 4.5
		aggressiveness -= 0.005
		max_dist = 0.5
		chase = true
	if chase:
		aggressiveness -= 0.01
		if aggressiveness <= base_aggressiveness:
			aggressiveness = base_aggressiveness
			speed = 100
			chase = false
			max_dist = 7
	var t = clamp(dist / max_distance, 0.0, 1.0)
	var current_transparency = lerp(min_transparency, max_transparency, t)
	
	var mat = color_rect.material
	if mat and mat is ShaderMaterial:
		mat.set_shader_parameter("Transparency", current_transparency)
	elif seen and dist < 20 and dist > 10: 
		mat.set_shader_parameter("Transparency", 2)
		player.sub_health(1*delta)
	if seen and !$AudioStreamPlayer3D.playing:
		$AudioStreamPlayer3D.play() 
	
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


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == player:
		player.sub_health(1000)
