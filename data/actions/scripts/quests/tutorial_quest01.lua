function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)	
   		queststatus = getPlayerStorageValue(cid,2003)
   		if queststatus == 2 then
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a backpack with something inside. Return to Elwynn and ask him about your mission.")
			doPlayerAddExp(cid,50) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 50 experience.") -- Show Exp
			container = doPlayerAddItem(cid, 1988, 1) -- backpack
			doAddContainerItem(container, 8711, 1) -- tutorial shovel
			doAddContainerItem(container, 8712, 1) -- tutorial rope
			pos = getCreaturePosition(cid) -- Player position
			doSendMagicEffect(pos, 12) -- Magic effect on player to denote successful quest
   			setPlayerStorageValue(cid,2003,3) -- Storage value to reflect quest done
   		else
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.") -- Message received when quest has already been completed or player is not eligible.
   		end
end