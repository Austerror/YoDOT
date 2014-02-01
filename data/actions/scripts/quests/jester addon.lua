function onUse(cid, item, fromPosition, itemEx, toPosition)
   		outfitStatus = getPlayerStorageValue(cid,2354)
		if getPlayerItemCount(cid,9693) >= 1 then
			if outfitStatus == -1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the jester addons.")
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid,270,3) -- f
				else
					doPlayerAddOutfit(cid,273,3) -- m
				end
				doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
				doPlayerRemoveItem(cid,9693,1)
				setPlayerStorageValue(cid,2354,1) -- Storage value to reflect quest done
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already have this addon.") -- Message received when quest has already been completed or player is not eligible.
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need the jester doll in your possession to do this.")
		end
end