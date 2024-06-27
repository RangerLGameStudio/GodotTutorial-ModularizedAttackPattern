extends StateMachineStates
class_name PlayerIdleState

func _init():
	StateName = Enums.PlayerState.Idle
func OnEnter():
	super.OnEnter()
	StateParent.AnimPlayback.travel("Idle")
	pass 

func OnExit():
	pass

func Process(delta):
	pass


func PhysicsProcess(delta):
	if StateParent.PlayerMovementManager.CheckAttackAvailable() == true:
		StateParent.PlayerMovementManager.ConsumeAttackCommand()
		var CurrentEquipPlaceholder = StateParent.HeldItemPlaceholder
		if (CurrentEquipPlaceholder!=null and CurrentEquipPlaceholder.ItemInUse!=null):
			OnRequestStateChange.emit(StateName, Enums.PlayerState.GroundAttack1)
			return


	super.PhysicsProcess(delta)
	pass
