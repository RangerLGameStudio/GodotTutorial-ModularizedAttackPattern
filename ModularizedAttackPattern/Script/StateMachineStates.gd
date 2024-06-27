extends Node
class_name StateMachineStates

@export var StateName:Enums.PlayerState=Enums.PlayerState.None
var StateParent:PlayerFiniteStateMachine
var Initialized:bool=false

signal OnRequestStateChange(OldState:Enums.PlayerState, NextState:Enums.PlayerState)


func Initialize(PassStateParent:PlayerFiniteStateMachine):
	StateParent=PassStateParent
	Initialized=true
# Called when the node enters the scene tree for the first time.
func OnEnter():
	print("Entered state: ", Enums.PlayerState.keys()[StateName])
	pass # Replace with function body.


func OnExit():
	pass

func Process(delta):
	pass

func PhysicsProcess(delta):
	PhysicsProcessY(delta)
	PhysicsProcessX(delta)
	
	pass


func PhysicsProcessX(delta):
	
		
	pass
func PhysicsProcessY(delta):
		pass
	#StateParent.Character.velocity.y=lerp(StateParent.Character.velocity.y,StateParent.PlayerMovementManager.CheckGravity(),0.8)




#How to make a new state:
#Step 1 : Make Anim
#Step 2 : Make State(Check enums are correct)
#Step 3 : Make Other states able to transit to that state
