extends AttackPattern


func OnPatternEnter():
	super.OnPatternEnter()
	ComboWindowTimer=0
	AttackAnimFinished=false
	CallingFSM.AnimPlayback.travel("SwordAttack2")
	CallingFSM.PlayerAnimationMaster.connect("animation_finished", OnAnimPlaybackEnd)
	

func OnPatternExit():
	super.OnPatternExit()
	ComboWindowTimer=0
	AttackAnimFinished=false
	CallingFSM.PlayerAnimationMaster.disconnect("animation_finished", OnAnimPlaybackEnd)
	pass

func PatternProcess(delta):
	if AttackAnimFinished==false:
		return
	if CallingFSM.PlayerMovementManager.CheckAttackAvailable() == true:
		CallingFSM.PlayerMovementManager.ConsumeAttackCommand()
		if (CallingFSM.HeldItemPlaceholder==null or CallingFSM.HeldItemPlaceholder.ItemInUse.AttackPatternNode==null):
			return
		if  CallingFSM.HeldItemPlaceholder.ItemInUse.AttackPatternNode.GroundAttack1!=null:
			CallingState.OnRequestStateChange.emit(CallingState.StateName, Enums.PlayerState.GroundAttack1)
			return
	if ComboWindowTimer<=ComboWindow:
		ComboWindowTimer+=delta
	else:
		CallingState.OnRequestStateChange.emit(CallingState.StateName, Enums.PlayerState.Idle)
		return
	pass

func PatternPhysicsProcess(_delta):
	CallingFSM.Character.velocity=Vector2(0,0)
	pass

func OnAnimPlaybackEnd(Anim_name):
	if Anim_name=="SwordAttack2":
		AttackAnimFinished=true
	
