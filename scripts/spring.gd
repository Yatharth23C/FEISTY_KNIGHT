extends Area2D
@onready var animated_sprite_spring: AnimatedSprite2D = $AnimatedSprite2D



func _on_body_entered(body: Node2D) -> void:
	animated_sprite_spring.play("ThrustUP")
	body.velocity.y = -350
	
