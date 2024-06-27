extends StateMachineStates
class_name StateMachineStatesAttack
var AttackPatternNode:AttackPattern
# Called when the node enters the scene tree for the first time.
func OnEnter():
	super.OnEnter()
	StateParent.PlayerMovementManager.ConsumeAttackCommand()
func GetAttackPatterNodeDamageRatio():
	if AttackPatternNode==null:
		return 1
	return AttackPatternNode.AttackPatternDamageRatio
func OnExit():
	super.OnExit()
