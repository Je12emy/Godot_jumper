extends State

class_name Idle

@export var AnimatedSprite : AnimatedSprite2D
@export var player : Player

func _enter():
	AnimatedSprite.play("idle")

func _update(_delta: float) -> void:
	player.stop()
	if Input.is_action_pressed("walk_left"):
		Transitioned.emit(self, "walk")
		return
	if Input.is_action_pressed("walk_right"):
		Transitioned.emit(self, "walk")
		return
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
		return
