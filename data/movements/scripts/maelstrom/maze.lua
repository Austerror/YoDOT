function onStepIn(cid, item, position, fromPosition)
	teleToPos = {x = 1076, y = 1067, z = 15}
	doTeleportThing(cid, teleToPos)
	doSendMagicEffect(fromPosition, 10)
	doSendMagicEffect(teleToPos, 10)
	return true
end