function onUse(cid, item, fromPosition, itemEx, toPosition)
	if doPlayerRemoveMoney(cid,50) == true then
		doRemoveItem(item.uid,1)
		doPlayerAddItem(cid,2168,1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, '50 gold pieces are required for this transmution.')
	end
	return TRUE
end