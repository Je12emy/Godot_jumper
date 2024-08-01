extends CharacterBody2D

class_name Player

@export var SPEED = 100

@export var JUMP_HEIGHT : float = 100
@export var JUMP_TIME_TO_PEAK : float = 0.5
@export var JUMP_TIME_TO_DESCENT : float = 0.3

@onready var JUMP_VELOCITY : float = ((2.0 * JUMP_HEIGHT) / JUMP_TIME_TO_PEAK) * -1.0
@onready var JUMP_GRAVITY : float = ((-2.0 * JUMP_HEIGHT) / (JUMP_TIME_TO_PEAK * JUMP_TIME_TO_PEAK)) * -1.0
@onready var FALL_GRAVITY : float = ((-2.0 * JUMP_HEIGHT) / (JUMP_TIME_TO_DESCENT * JUMP_TIME_TO_DESCENT)) * -1.0


func _physics_process(delta):
	velocity.y += _get_gravity() * delta 
	move_and_slide()
	
func _get_gravity() -> float:
	return JUMP_GRAVITY if velocity.y < 0.0 else FALL_GRAVITY

func stop():
	velocity.x = 0

func jump():
	velocity.y = JUMP_VELOCITY
