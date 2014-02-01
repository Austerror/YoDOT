function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid) == TRUE) then
		if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == 2202 or getCreatureCondition(cid, CONDITION_INVISIBLE) == true then
			-- nothing to do
		else
			doTeleportThing(cid, fromPosition, true)
		end
		--doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Invis condition = ' .. getCreatureCondition(cid, CONDITION_INVISIBLE) .. '.')
	end
	return TRUE
end