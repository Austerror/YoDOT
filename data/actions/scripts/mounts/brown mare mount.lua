function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerMount(cid,26) == false then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		doPlayerAddMount(cid, 26)
		doRemoveItem(item.uid)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Congratulations! You have learned the Brown Mare mount.')
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already know this mount.')
	end
	return TRUE
end