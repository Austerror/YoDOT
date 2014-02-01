function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)	
   		queststatus = getPlayerStorageValue(cid,2007)
   		if queststatus == -1 then
   			doPlayerAddItem(cid, 2482, 1) -- studded helmet
			doPlayerAddItem(cid, 2484, 1) -- studded armor
			doPlayerAddItem(cid, 2468, 1) -- studded legs
			doPlayerAddItem(cid, 2643, 1) -- leather boots

			pos = getCreaturePosition(cid) -- Player position
			doSendMagicEffect(pos, 12) -- Magic effect on player to denote successful quest
   			setPlayerStorageValue(cid,2007,1) -- Storage value to reflect quest done
			if getPlayerStorageValue(cid,2006) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a studded armor set. That\'s everything, now return to Elwynn.")
				doPlayerAddExp(cid,50) -- give Exp
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 50 experience.") -- Show Exp
				setPlayerStorageValue(cid,2003,6)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a studded armor set. Check the weapon rack for a weapon and a shield.")
			end
   		else
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.") -- Message received when quest has already been completed or player is not eligible.
   		end
end