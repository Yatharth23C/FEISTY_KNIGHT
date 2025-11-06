extends CharacterBody2D



const SPEED = 100.0
const JUMP_VELOCITY = -250.0
var dead = false
var playdeadanim = false
var hasKey = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var lives_label: Label = $"../CanvasLayer/Lives"


func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	#Debug
	
	#Update Lives
	lives_label.text = "LIVES: "+str(Gamemanager.lives)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	#flip the sprite
	if direction>0:
		animated_sprite.flip_h = false;
	elif direction <0:
		animated_sprite.flip_h = true;
	
	#handle animation
	if is_on_floor():
		if direction==0 && !dead:
			animated_sprite.play("Idle")
		elif !dead && direction!=0:
			animated_sprite.play("running")
	elif !dead:
		animated_sprite.play("Jump")
		
	if(dead && playdeadanim):
		Gamemanager.lives-=1
		Gamemanager.current_score = 0
		animated_sprite.play("Death")
		death_sound.play()
		playdeadanim = false
	
	if direction && !dead:
		velocity.x = direction * SPEED
	elif !dead:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
