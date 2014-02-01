function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 30
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2341) == -1 then
		if playerCap >= itemWeight then
			stampedLetter = doPlayerAddItem(cid, 2598, 1)
			doSetItemText(stampedLetter, "Pirates have boarded our vessel and I fear that I will be captured. If anyone finds this letter please seek out Leruno and give it to him.")
			doSetItemActionId(stampedLetter, 2343)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a stamped letter.')
			setPlayerStorageValue(cid, 2341, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a stamped letter weighing .3 of an ounce, it is too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
