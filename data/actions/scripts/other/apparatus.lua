function onUse(cid, item, fromPosition, itemEx, toPosition)
	apparatusIn = {x=1285,y=982,z=7}
	
	if itemEx.itemid == 9893 then
		if getCreatureSkullType(cid) == SKULL_NONE then
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doTeleportThing(cid,apparatusIn)
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
			doTransformItem(item.uid,9892)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You can\'t use this while you are skulled.')
		end
	end
	return TRUE
end