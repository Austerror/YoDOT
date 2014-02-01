function onUse(cid, item, fromPosition, itemEx, toPosition)
   		outfitStatus = getPlayerStorageValue(cid,2312)
		if getPlayerItemCount(cid,13926) >= 1 then
			if outfitStatus == -1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the plague bell addon.")
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid,430,1) -- f
				else
					doPlayerAddOutfit(cid,431,1) -- m
				end
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				doPlayerRemoveItem(cid,13926,1)
				setPlayerStorageValue(cid,2312,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already have this addon.") -- Message received when quest has already been completed or player is not eligible.
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need the plague bell in your possession to do this.")
		end
end