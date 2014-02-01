function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 5919 then -- dragon claw

		if getPlayerStorageValue(cid,2430) == -1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the warrior shoulder spike addon.")
			if getPlayerSex(cid) == 0 then
				doPlayerAddOutfit(cid,142,1) -- f
			else
				doPlayerAddOutfit(cid,134,1) -- m
			end
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
			doRemoveItem(item.uid,1)
			doRemoveItem(itemEx.uid,1)
			setPlayerStorageValue(cid,2430,1) -- Storage value to reflect quest done
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You already have this addon.") -- Message received when quest has already been completed or player is not eligible.
		end	
	end
	return TRUE
end