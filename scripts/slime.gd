extends Node2D
const speed = 60
var direction =1
@onready var ray_cast_right: RayCast2D = $KillZone/RayCastRight
@onready var ray_cast_left: RayCast2D = $KillZone/RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right_2: RayCast2D = $KillZone/RayCastRight2
@onready var ray_cast_left_2: RayCast2D = $KillZone/RayCastLeft2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding() or !ray_cast_right_2.is_colliding():
		direction =-1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding() or !ray_cast_left_2.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h= false
	position.x += direction*speed*delta
