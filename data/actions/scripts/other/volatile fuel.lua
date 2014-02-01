function onUse(cid, item, fromPosition, itemEx, toPosition)
		if itemEx.itemid == 9892 and itemEx.uid == 2432 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The strange apparatus bursts into life.")
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
			doTransformItem(itemEx.uid,9893)
		end	
	return TRUE
end