function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 7.5
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2422) == -1 then
		if playerCap >= itemWeight then
			doPlayerAddItem(cid, 2195, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found boots of haste.')
			setPlayerStorageValue(cid, 2422, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found boots of haste weighing 7.5 ounces, they are too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
