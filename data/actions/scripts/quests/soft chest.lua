function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 8
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2419) == -1 then
		if playerCap >= itemWeight then
			doPlayerAddItem(cid, 6132, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a pair of soft boots.')
			setPlayerStorageValue(cid, 2419, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a pair of soft boots weighing 8 ounces, they are too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
