function onUse(cid, item, fromPosition, itemEx, toPosition)
   		outfitStatus = getPlayerStorageValue(cid,2454)
		if getPlayerItemCount(cid,12656) >= 1 then
			if outfitStatus == -1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the wayfarer sedge hat addon.")
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid,366,2) -- f
				else
					doPlayerAddOutfit(cid,367,2) -- m
				end
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				doPlayerRemoveItem(cid,12656,1)
				setPlayerStorageValue(cid,2454,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already have this addon.") -- Message received when quest has already been completed or player is not eligible.
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need the sedge hat in your possession to do this.")
		end
		return true
end