class_name BasicEnemy extends Enemy

func _ready() -> void:
	health = 120
	damage = 10.0
	speed = 2.5
	attack_rate = 1.5
	$Sketchfab_Scene/AnimationPlayer.play("Take 001")
