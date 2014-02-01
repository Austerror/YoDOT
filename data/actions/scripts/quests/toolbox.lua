function onUse(cid, item, fromPosition, itemEx, toPosition)
		if getPlayerStorageValue(cid,2431) == -1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found some apparatus fuel.")
			doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
			setPlayerStorageValue(cid,2431,1) -- Storage value to reflect quest done
			doPlayerAddItem(cid,11100,1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.") -- Message received when quest has already been completed or player is not eligible.
		end	
	return TRUE
end