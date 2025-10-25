extends CharacterBody3D

@onready var nav_agent = $NavAgent/NavigationAgent3D
@onready var player = get_tree().get_current_scene().get_node("Player")
@onready var color_rect = get_tree().get_current_scene().get_node("CanvasLayer/ColorRect")

var next_position : Vector3
const speed = 2.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	look_at(player.position)
	nav_agent.target_position = player.global_position
	next_position = nav_agent.get_next_path_position()
	velocity = global_position.direction_to(next_position) * speed
	move_and_slide()

var max_distance := 10.0 #we can adjust the required distance and stuff
var min_transparency := 0.0
var max_transparency := 8.0

func _process(delta):
	var dist = global_position.distance_to(player.global_position)
	var t = clamp(dist / max_distance, 0.0, 1.0)
	var current_transparency = lerp(min_transparency, max_transparency, t)
	
	var mat = color_rect.material
	if mat and mat is ShaderMaterial:
		mat.set_shader_parameter("Transparency", current_transparency)
		
		
		
		
		
		
		
		
