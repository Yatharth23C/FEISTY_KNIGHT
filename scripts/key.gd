extends Area2D
@onready var key: Area2D = $"."

func _ready() -> void:
	key.visible = true
func _on_body_entered(body: Node2D) -> void:
	if(body.name =="Player"):
		body.hasKey= true
		key.visible = false
