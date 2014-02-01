function onUse(cid, item, fromPosition, itemEx, toPosition)
		local playerCap = getPlayerFreeCap(cid)
   		queststatus = getPlayerStorageValue(cid,2494)
   		if queststatus == -1 then
			if playerCap >= 24 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Black Skull.")
				doPlayerAddItem(cid, 9969, 1)
				doSendMagicEffect(getCreaturePosition(cid), 12)
				setPlayerStorageValue(cid,2494,1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Black Skull that weighs 24 ounces. It is too heavy to pick up.")
			end
   		else
   			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
   		end
end