function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 2358) == -1 then
		doPlayerAddItem(cid, 7487, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a toy mouse.')
		doCreatureSay(cid,"SQUEEEK!", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid, 2358, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'There is nothing here.')
	end
	return true
end
