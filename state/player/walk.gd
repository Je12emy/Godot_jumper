extends State

class_name Walk

@export var animated_sprite : AnimatedSprite2D
@export var player : Player

func _enter() -> void:
	animated_sprite.play("walk")

func _update(_delta: float) -> void:
	if Input.is_action_pressed("walk_left"):
		animated_sprite.flip_h = true
		player.velocity.x = -player.SPEED
		if Input.is_action_just_pressed("jump"):
			Transitioned.emit(self, "jump")
			return
		return
	if Input.is_action_pressed("walk_right"):
		animated_sprite.flip_h = false
		player.velocity.x = player.SPEED
		if Input.is_action_just_pressed("jump"):
			Transitioned.emit(self, "jump")
			return
		return
	if Input.is_action_just_released("walk_left") or Input.is_action_just_released("walk_right"):
		Transitioned.emit(self,"idle")
		return
