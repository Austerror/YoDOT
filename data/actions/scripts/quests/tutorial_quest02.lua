function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)	
   		queststatus = getPlayerStorageValue(cid,2006)
   		if queststatus == -1 then
   			doPlayerAddItem(cid, 2511, 1) -- brass shield
			doPlayerAddItem(cid, 2385, 1) -- sabre
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effect on player to denote successful quest
   			setPlayerStorageValue(cid,2006,1) -- Storage value to reflect quest done
			if getPlayerStorageValue(cid,2007) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a sabre and a brass shield. That\'s everything, now return to Elwynn.")
				doPlayerAddExp(cid,50) -- give Exp
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 50 experience.") -- Show Exp
				setPlayerStorageValue(cid,2003,6)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a sabre and a studded shield. Check the armor rack for some armor.")
			end
   		else
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.") -- Message received when quest has already been completed or player is not eligible.
   		end
end