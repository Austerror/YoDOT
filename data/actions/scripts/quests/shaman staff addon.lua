function onUse(cid, item, fromPosition, itemEx, toPosition)
   		outfitStatus = getPlayerStorageValue(cid,2455)
		if getPlayerItemCount(cid,2401) >= 1 and getPlayerItemCount(cid,3955) >= 1 then
			if itemEx.itemid == 3955 then
				if outfitStatus == -1 then
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the shaman staff addon.")
					if getPlayerSex(cid) == 0 then
						doPlayerAddOutfit(cid,158,2) -- f
					else
						doPlayerAddOutfit(cid,154,2) -- m
					end
					doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
					doPlayerRemoveItem(cid,2401,1)
					doPlayerRemoveItem(cid,3955,1)
					setPlayerStorageValue(cid,2455,1) -- Storage value to reflect quest done
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already have this addon.") -- Message received when quest has already been completed or player is not eligible.
				end
			end
		end
		return true
end