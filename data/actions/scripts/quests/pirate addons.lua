function onUse(cid, item, fromPosition, itemEx, toPosition)

		if getPlayerItemCount(cid,11424) >= 1 and getPlayerItemCount(cid,11425) >= 1 and getPlayerItemCount(cid,11426) >= 1 then
			doPlayerRemoveItem(cid,11424,1)
			doPlayerRemoveItem(cid,11425,1)
			doPlayerRemoveItem(cid,11426,1)
			if getPlayerSex(cid) == 0 then
				doPlayerAddOutfit(cid,155,3) -- f
			else
				doPlayerAddOutfit(cid,151,3) -- m
			end
			doSendMagicEffect(getCreaturePosition(cid), 12)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the pirate addons!")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don\'t have all the items.")
		end
end