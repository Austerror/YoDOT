function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerMount(cid,27) == false then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		doPlayerAddMount(cid, 27)
		doRemoveItem(item.uid)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Congratulations! You have learned the Ladybug mount.')
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You already know this mount.')
	end
	return TRUE
end