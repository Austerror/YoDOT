function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 97.2
	local playerCap = getPlayerFreeCap(cid)
	if getPlayerStorageValue(cid,30027) == -1 then
		if playerCap >= itemWeight then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a bag with some items in it.")
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
			setPlayerStorageValue(cid,30027,1) -- Storage value to reflect quest done
			container = doPlayerAddItem(cid, 1987, 1) -- bag
			doAddContainerItem(container, 15620, 1) -- trophy of tanjis
			doAddContainerItem(container, 2152, 20) -- 20 platinum coins
			doAddContainerItem(container, 15403, 1) -- necklace of the deep
			doAddContainerItem(container, 15453, 1) -- warrior's shield
			doAddContainerItem(container, 15435, 1) -- tanjis' sight
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a bag weighing 97.2 ounces, it is too heavy to pick up.')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.") -- Message received when quest has already been completed or player is not eligible.
	end
	return TRUE
end