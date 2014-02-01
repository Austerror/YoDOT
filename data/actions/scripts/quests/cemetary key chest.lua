function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 1
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2404) == -1 then
		if playerCap >= itemWeight then
			key2402 = doPlayerAddItem(cid, 2089, 1)
			doItemSetAttribute(key2402, "aid", 2402)
			--doSetItemActionId(key3301, 3301)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a copper key. It has the number 2402 stamped on it.')
			setPlayerStorageValue(cid, 2404, 1) -- quest SV
			setPlayerStorageValue(cid, 2403, 1) -- special door above AID
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a key weighing 1 ounce, it is too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
end