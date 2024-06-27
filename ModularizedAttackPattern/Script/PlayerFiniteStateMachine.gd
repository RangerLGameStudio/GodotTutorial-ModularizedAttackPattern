extends Node
class_name PlayerFiniteStateMachine
@export var Character:CharacterBody2D
@export var HeldItemPlaceholder:Node2D
@export var PlayerAnimationMaster:AnimationTree
@export var PlayerMovementManager:MovementManager

#@onready var PlayerEquipManager=EquipSystemMaster

var StatesArray={}
var InitialState:Enums.PlayerState=Enums.PlayerState.Idle


var PreviousState:StateMachineStates=null
var CurrentState:StateMachineStates=null

var AnimPlayback
# Called when the node enters the scene tree for the first time.
func _ready():
	AnimPlayback=PlayerAnimationMaster.get("parameters/StateMachine/playback")
	for node in get_children():
		if node is StateMachineStates and node.StateName != Enums.PlayerState.None:
			StatesArray[node.StateName]=node
			node.Initialize(self)
			node.OnRequestStateChange.connect(OnRequestStateChangeHandler)
			
			if node.StateName == InitialState:
				CurrentState=node
				CurrentState.OnEnter()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if CurrentState!=null:
		CurrentState.Process(delta)
	#ProcessStoredCall(delta)
	pass

func _physics_process(delta):
	if CurrentState!=null:
		CurrentState.PhysicsProcess(delta)
	pass

	
func OnRequestStateChangeHandler(OldState:Enums.PlayerState, NextStateEnum:Enums.PlayerState):


	if CurrentState.StateName != OldState:
		return

	if NextStateEnum not in StatesArray.keys():
		return

	if CurrentState == null:
		return

	var NextState = StatesArray[NextStateEnum]


	CurrentState.OnExit()
	NextState.OnEnter()

	PreviousState = CurrentState
	CurrentState = NextState
	pass
	
func ForceChangeState(NextStateEnum:Enums.PlayerState):
	if CurrentState!=null:
		CurrentState.OnExit()
		
	if NextStateEnum not in StatesArray.keys():
		return
	var NextState = StatesArray[NextStateEnum]
	if NextState!=null:
		NextState.OnEnter()

	PreviousState = CurrentState
	CurrentState = NextState



func CheckPlayerIsInAttack():
	return(CurrentState is StateMachineStatesAttack)
func CheckPlayerCurrentAttackPattern()->AttackPattern:
	if !(CurrentState is StateMachineStatesAttack):
		return null
	else:
		return CurrentState.AttackPatternNode



