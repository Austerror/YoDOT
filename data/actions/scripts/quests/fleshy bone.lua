function onUse(cid, item, fromPosition, itemEx, toPosition)

	if isCreature(itemEx.uid) then
		if getCreatureName(itemEx.uid) == 'Wolf' then
			doRemoveCreature(itemEx.uid)
			doSendMagicEffect(toPosition, 12)
			doPlayerAddItem(cid, 13633, 1)
			doPlayerRemoveItem(cid, 13830, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have captured the wolf. Return it to Leruno.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"This creature is not a wolf.")
		end
	end

end