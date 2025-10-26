class_name PageButton extends Button

@onready var player = get_tree().get_current_scene().get_node("Player")
@export var page : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
