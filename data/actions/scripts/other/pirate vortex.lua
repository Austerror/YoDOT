function onUse(cid, item, fromPosition, itemEx, toPosition)
	pirateShipXYZ = {x=1115,y=1165,z=6}
	if getPlayerStorageValue(cid, 2341) >= 4 then
		pos = getCreaturePosition(cid)
		doSendMagicEffect(pos, 10)
		doTeleportThing(cid,pirateShipXYZ)
		pos = getCreaturePosition(cid)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Nothing happens.')
	end
	return true
end
