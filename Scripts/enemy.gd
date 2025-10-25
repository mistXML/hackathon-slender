class_name Enemy extends CharacterBody3D

@export var health : float
@export var damage : float = 25
@export var speed : float = 2.5
@export var attack_rate : float
var time : float = 15.0
var enemy_range : float = 5
var next_position: Vector3
var attack_timer : float = attack_rate
@onready var nav_agent = $NavigationAgent3D
@onready var player = get_tree().get_current_scene().get_node("Player")

func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()
	
	if (global_position - player.global_position) < Vector3(enemy_range,0,0) or (global_position - player.global_position) < Vector3(0,0,enemy_range):
		nav_agent.target_position = player.global_position
	# Set the target position
	else:
		time -= delta
		if time <= 0:
			time = 15.0
			random_move()
		# Count down from 15 seconds, then calculate a new position for the player to move to
	next_position = nav_agent.get_next_path_position() # Move towards next node in path
	
	if nav_agent.is_target_reachable() and nav_agent.target_position == player.global_position:
		if nav_agent.is_navigation_finished():
			attack_timer -= delta
			if attack_timer <= 0:
				attack_timer = attack_rate
				attack_target()
			# If the enemy can reach the player, and are next to the player, the attack method is called
			# Attack timer is equal to the attack rate which is the time between attack in seconds
	
	velocity = global_position.direction_to(next_position) * speed
	move_and_slide()
	
	# Enemy's velocity is the direction towards the next position multiplied by its speed

func attack_target() -> void:
	player.damage(damage)
	# Set player health to current health - damage

func random_move():
	nav_agent.target_position = Vector3(randf_range(-100,100), 0, randf_range(-100,100))
	
func damage_enemy(dmg):
	health -= dmg
