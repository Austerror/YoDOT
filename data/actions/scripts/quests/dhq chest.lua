function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 84.5
	local playerCap = getPlayerFreeCap(cid)	
	if getPlayerStorageValue(cid, 2481) == -1 then
		if playerCap >= itemWeight then
			doPlayerAddItem(cid, 2493, 1)
			doPlayerAddItem(cid, 2520, 1)
			doPlayerAddItem(cid, 2645, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a demon helm, demon shield and steel boots.')
			setPlayerStorageValue(cid, 2481, 1) -- quest SV
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found some items weighing 84.5 ounces, they are too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
end