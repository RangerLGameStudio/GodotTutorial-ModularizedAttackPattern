extends StateMachineStatesAttack
class_name PlayerGroundAttack3State

func _init():
	StateName = Enums.PlayerState.GroundAttack2
func OnEnter():
	super.OnEnter()
	
	var CurrentEquipPlaceholder = StateParent.HeldItemPlaceholder 
	if (CurrentEquipPlaceholder==null or CurrentEquipPlaceholder.ItemInUse.AttackPatternNode==null or CurrentEquipPlaceholder.ItemInUse.AttackPatternNode.GroundAttack3==null):
		StateParent.OnRequestStateChange.emit(StateName, Enums.PlayerState.Idle)
		return
	AttackPatternNode=CurrentEquipPlaceholder.ItemInUse.AttackPatternNode.GroundAttack3
	AttackPatternNode.Initialize(self)
	StateParent.PlayerAnimationMaster.set("parameters/TimeScale/scale",AttackPatternNode.AttackSpeed)
	AttackPatternNode.OnPatternEnter()
	pass 

func OnExit():
	if AttackPatternNode==null:
		return
	AttackPatternNode.OnPatternExit()
	StateParent.PlayerAnimationMaster.set("parameters/TimeScale/scale",1.0)
	pass

func Process(delta):
	if AttackPatternNode==null:
		OnRequestStateChange.emit(StateName, Enums.PlayerState.Idle)
		return
	AttackPatternNode.PatternProcess(delta)

func PhysicsProcess(delta):
	if AttackPatternNode==null:
		OnRequestStateChange.emit(StateName, Enums.PlayerState.Idle)
		return
	AttackPatternNode.PatternPhysicsProcess(delta)
	pass

