extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var flip = false
var attacking = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#Handle Attack and sword flip
	if(Input.is_action_just_pressed("Attack") && !flip):
		animated_sprite_2d.position = Vector2(-1,4)
		animated_sprite_2d.play("strike")
		attacking = true
	elif(Input.is_action_just_pressed("Attack") && flip):
		animated_sprite_2d.position = Vector2(-19,4)
		animated_sprite_2d.play("strikeflip")
		attacking = true

func _on_animated_sprite_2d_animation_finished() -> void:
	attacking = false
	if(!flip):
		animated_sprite_2d.play("default")
	elif(flip):
		animated_sprite_2d.play("default_flip")


func _on_body_entered(body: Node2D) -> void:
	
	print(body.name)
	body.queue_free()
