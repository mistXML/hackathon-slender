extends CharacterBody3D

@onready var nav_agent = $NavAgent/NavigationAgent3D
@onready var player = get_tree().get_current_scene().get_node("Player")
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
