function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 1
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2489) == -1 then
		if playerCap >= itemWeight then
			key2490 = doPlayerAddItem(cid, 2086, 1)
			doItemSetAttribute(key2490, "aid", 2490)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a silver key. It has the number 2490 stamped on it.')
			setPlayerStorageValue(cid, 2489, 1) -- quest SV
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a key weighing 1 ounce, it is too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end