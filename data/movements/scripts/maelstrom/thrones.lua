function onStepIn(cid, item, position, fromPosition)
	if item.actionid == 2471 and getPlayerStorageValue(cid,2471) == -1 then -- 1st throne
		setPlayerStorageValue(cid,2471,1)
		doSendMagicEffect(position, 10)
	elseif item.actionid == 2472 and getPlayerStorageValue(cid,2472) == -1 then -- 2nd throne
		setPlayerStorageValue(cid,2472,1)
		doSendMagicEffect(position, 10)
	elseif item.actionid == 2473 and getPlayerStorageValue(cid,2473) == -1 then -- 3rd throne
		setPlayerStorageValue(cid,2473,1)
		doSendMagicEffect(position, 10)
	elseif item.actionid == 2474 and getPlayerStorageValue(cid,2474) == -1 then -- 4th throne
		setPlayerStorageValue(cid,2474,1)
		doSendMagicEffect(position, 10)
	end
	if getPlayerStorageValue(cid,2471) == 1 and getPlayerStorageValue(cid,2472) == 1 and getPlayerStorageValue(cid,2473) == 1 and getPlayerStorageValue(cid,2474) == 1 then
		setPlayerStorageValue(cid,2475,1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have touched all four thrones.")
	end
	return true
end