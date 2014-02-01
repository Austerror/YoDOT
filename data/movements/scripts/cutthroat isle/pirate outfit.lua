function onStepIn(cid, item, position, fromPosition)
	headSlot = getPlayerSlotItem(cid, 1) -- 6096
	armorSlot = getPlayerSlotItem(cid, 4) -- 6095
	legSlot = getPlayerSlotItem(cid, 7) -- 5918
	canPass = getPlayerStorageValue(cid,2359)
	if(isPlayer(cid) == TRUE) then
		if headSlot.itemid == 6096 and armorSlot.itemid == 6095 and legSlot.itemid == 5918 then
			setPlayerStorageValue(cid,2359,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have entered the room undetected. It\'s probably a good idea to put your regular armour back on.")
		elseif canPass == 1 then
		
		else
			doTeleportThing(cid, fromPosition, FALSE)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You are not welcome in here!")
		end
	end
	return TRUE
end