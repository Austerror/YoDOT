function onUse(cid, item, fromPosition, itemEx, toPosition)

		if getPlayerItemCount(cid,9694) >= 1 and getPlayerItemCount(cid,9695) >= 1 and getPlayerItemCount(cid,9696) >= 1 and getPlayerItemCount(cid,9697) >= 1 and getPlayerItemCount(cid,9698) >= 1 and getPlayerItemCount(cid,9699) >= 1 then
			doPlayerRemoveItem(cid,9694,1)
			doPlayerRemoveItem(cid,9695,1)
			doPlayerRemoveItem(cid,9696,1)
			doPlayerRemoveItem(cid,9697,1)
			doPlayerRemoveItem(cid,9698,1)
			doPlayerRemoveItem(cid,9699,1)
			doPlayerAddItem(cid,9693,1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have reassembled the jester doll.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need all the jester doll parts to put it back together.")
		end
end