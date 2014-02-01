function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 2386 and itemEx.uid == 2493 and getPlayerStorageValue(cid,2493) == -1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The swift blow from the axe seems to have dislodged some of the growth.')
		setPlayerStorageValue(cid,2493,1)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
		return true
	else
		return destroyItem(cid, itemEx, toPosition)
	end
end