extends Node

class_name State

signal Transitioned(old_state: State, name: String)

func _enter() -> void:
	pass

func _update(delta: float) -> void:
	pass
	
func _physics_update(delta: float) -> void:
	pass
	
func _exit() -> void:
	pass
