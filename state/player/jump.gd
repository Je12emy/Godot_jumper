extends State

class_name Jump

@export var animated_sprite : AnimatedSprite2D
@export var player : Player

func _enter():
	animated_sprite.play("jump")
	player.jump()

func _physics_update(_delta: float) -> void:
	if player.is_on_floor():
		Transitioned.emit(self, "idle")
		return
	# The player is able to move within the air
	if Input.is_action_pressed("walk_left"):
		animated_sprite.flip_h = true
		player.velocity.x = -player.SPEED
		return
	if Input.is_action_pressed("walk_right"):
		animated_sprite.flip_h = false
		player.velocity.x = player.SPEED
		return
