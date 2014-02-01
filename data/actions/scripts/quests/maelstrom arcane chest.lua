function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)	
   		queststatus = getPlayerStorageValue(cid,2479)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found an arcane staff.")
			doPlayerAddItem(cid, 2453, 1) -- arcane staff
			pos = getCreaturePosition(cid) -- Player position
			doSendMagicEffect(pos, 12) -- Magic effect on player to denote successful quest
   			setPlayerStorageValue(cid,2479,1) -- Storage value to reflect quest done
   		else
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.") -- Message received when quest has already been completed or player is not eligible.
   		end
end