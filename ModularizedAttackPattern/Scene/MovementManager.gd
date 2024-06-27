extends Node
class_name MovementManager

var IsBufferAttack:bool = false
var IsUpPressed:bool = false



func _input(event):
	
	if Input.is_action_just_pressed("ui_accept"):
		IsBufferAttack=true

func CheckAttackAvailable():
	return IsBufferAttack
func ConsumeAttackCommand():
	IsBufferAttack=false
