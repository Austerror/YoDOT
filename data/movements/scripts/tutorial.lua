function onStepOut(cid, item, position, fromPosition)
	doSendMagicEffect({x = 999, y = 997, z = 1, stackpos = 1}, 55)
	doCreatureSay(cid,"Hold shift and click the sign with your left mouse button.", TALKTYPE_ORANGE_1)
	return TRUE
end