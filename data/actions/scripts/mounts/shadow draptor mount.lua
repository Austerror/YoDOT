function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerMount(cid,24) == false then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		doPlayerAddMount(cid, 24)
		doRemoveItem(item.uid)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Congratulations! You have learned the Shadow Draptor mount.')
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already know this mount.')
	end
	return TRUE
end