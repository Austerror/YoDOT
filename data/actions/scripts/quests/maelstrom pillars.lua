function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 2465 and getPlayerStorageValue(cid,2470) ~= 1 then -- first pillar
		if getPlayerStorageValue(cid,2465) == -1 and getPlayerStorageValue(cid,2466) == -1 and getPlayerStorageValue(cid,2467) == -1 and getPlayerStorageValue(cid,2468) == -1 then
			setPlayerStorageValue(cid,2465, 1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			setPlayerStorageValue(cid,2465, -1)
			setPlayerStorageValue(cid,2466, -1)
			setPlayerStorageValue(cid,2467, -1)
			setPlayerStorageValue(cid,2468, -1)
			doSendMagicEffect(getCreaturePosition(cid), 2)
		end
	elseif item.actionid == 2466 and getPlayerStorageValue(cid,2470) ~= 1 then
		if getPlayerStorageValue(cid,2465) == 1 and getPlayerStorageValue(cid,2466) == -1 and getPlayerStorageValue(cid,2467) == -1 and getPlayerStorageValue(cid,2468) == -1 then
			setPlayerStorageValue(cid,2466, 1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			setPlayerStorageValue(cid,2465, -1)
			setPlayerStorageValue(cid,2466, -1)
			setPlayerStorageValue(cid,2467, -1)
			setPlayerStorageValue(cid,2468, -1)
			doSendMagicEffect(getCreaturePosition(cid), 2)
		end
	elseif item.actionid == 2467 and getPlayerStorageValue(cid,2470) ~= 1 then
		if getPlayerStorageValue(cid,2465) == 1 and getPlayerStorageValue(cid,2466) == 1 and getPlayerStorageValue(cid,2467) == -1 and getPlayerStorageValue(cid,2468) == -1 then
			setPlayerStorageValue(cid,2467, 1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			setPlayerStorageValue(cid,2465, -1)
			setPlayerStorageValue(cid,2466, -1)
			setPlayerStorageValue(cid,2467, -1)
			setPlayerStorageValue(cid,2468, -1)
			doSendMagicEffect(getCreaturePosition(cid), 2)
		end
	elseif item.actionid == 2468 and getPlayerStorageValue(cid,2470) ~= 1 then
		if getPlayerStorageValue(cid,2465) == 1 and getPlayerStorageValue(cid,2466) == 1 and getPlayerStorageValue(cid,2467) == 1 and getPlayerStorageValue(cid,2468) == -1 then
			setPlayerStorageValue(cid,2468, 1)
			setPlayerStorageValue(cid,2470, 1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			setPlayerStorageValue(cid,2465, -1)
			setPlayerStorageValue(cid,2466, -1)
			setPlayerStorageValue(cid,2467, -1)
			setPlayerStorageValue(cid,2468, -1)
			doSendMagicEffect(getCreaturePosition(cid), 2)
		end
	end
	return true
end