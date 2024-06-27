extends Node
class_name AttackPattern
var Initialized:bool=false
var CallingState:StateMachineStatesAttack
var CallingFSM:PlayerFiniteStateMachine

var AttackAnimFinished:bool=false

@export var ComboWindow:float = 0.0
var ComboWindowTimer:float=0
#How much damage does this combo deal
@export var AttackPatternDamageRatio:float = 1.0
@export var AttackSpeed:float = 1.0
@export var CauseKnockback:bool=false
@export var CauseInvincibility:bool=false
func Initialize(PassAttackStateParent:StateMachineStatesAttack):
	CallingState=PassAttackStateParent
	CallingFSM=CallingState.StateParent
	Initialized=true
	

func OnPatternEnter():

	pass 

func OnPatternExit():
	pass

func PatternProcess(delta):
	pass

func PatternPhysicsProcess(delta):
	if Initialized:
		CallingState.super.PhysicsProcess(delta)
	pass

