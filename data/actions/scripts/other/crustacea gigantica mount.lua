function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerMount(cid,7) == false then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		doPlayerAddMount(cid, 7)
		doRemoveItem(item.uid)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Congratulations! You have learned the Titanica mount.')
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already know this mount.')
	end
	return TRUE
end