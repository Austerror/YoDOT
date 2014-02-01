function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 99
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2491) == -1 then
		if playerCap >= itemWeight then
			doPlayerAddItem(cid, 2487, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a crown armor.')
			setPlayerStorageValue(cid, 2491, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a crown armor weighing 99 ounces, it is too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
