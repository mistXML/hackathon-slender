extends Node3D

@export var page_texture : Texture
@export var page_num : int
var player_in_area = false
@onready var player = get_tree().get_current_scene().get_node("Player")
signal page_collected


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MeshInstance3D.mesh.material.albedo_texture = page_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_player_player_interact() -> void:
	if player_in_area:
		player.add_to_inventory(page_num)
		page_collected.emit()
		queue_free()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == player:
		player_in_area = true
	
func _on_area_3d_body_exited(body: Node3D) -> void:
		if body == player:
			player_in_area = false
