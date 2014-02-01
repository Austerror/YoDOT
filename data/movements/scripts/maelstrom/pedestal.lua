function onStepIn(cid, item, position, fromPosition)
	teleToPos = {x = 1125, y = 1072, z = 13}
	if getPlayerStorageValue(cid,2470) == 1 then
		doTeleportThing(cid, teleToPos)
		doSendMagicEffect(fromPosition, 10)
		doSendMagicEffect(teleToPos, 10)
	end
	return true
end