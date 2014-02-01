function onUse(cid, item, fromPosition, itemEx, toPosition)
   		outfitStatus = getPlayerStorageValue(cid,2452)
		if getPlayerItemCount(cid,13756) >= 1 then
			if outfitStatus == -1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the elementalist cape addon.")
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid,433,1) -- f
				else
					doPlayerAddOutfit(cid,432,1) -- m
				end
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				doPlayerRemoveItem(cid,13756,1)
				setPlayerStorageValue(cid,2452,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already have this addon.") -- Message received when quest has already been completed or player is not eligible.
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need the mages cap in your possession to do this.")
		end
		return true
end