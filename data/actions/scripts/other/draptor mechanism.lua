function onUse(cid, item, fromPosition, itemEx, toPosition)
	draptorIn = {x=1300,y=1014,z=7}
	draptorOut = {x=1300,y=1012,z=7}
		if itemEx.actionid == 2433 then
			doTeleportThing(cid,draptorIn)
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
		elseif itemEx.actionid == 2434 then
			doTeleportThing(cid,draptorOut)
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
		end	
	return TRUE
end