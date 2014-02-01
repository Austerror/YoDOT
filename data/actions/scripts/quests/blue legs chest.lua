function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 18
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2413) == -1 then
		if playerCap >= itemWeight then
			doPlayerAddItem(cid, 7730, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a pair of blue legs.')
			setPlayerStorageValue(cid, 2413, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a pair of blue legs weighing 18 ounces, they are too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
