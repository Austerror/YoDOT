function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 40
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2619) == -1 then
		if playerCap >= itemWeight then
			doPlayerAddItem(cid, 2504, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found dwarven legs.')
			setPlayerStorageValue(cid, 2619, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found dwarven legs weighing 40 ounces, they are too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
