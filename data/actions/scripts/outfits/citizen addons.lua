function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid,2435) == -1 and getPlayerItemCount(cid,5878) >= 100 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the citizen hat and backpack addons.")
		if getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid,136,3) -- f
		else
			doPlayerAddOutfit(cid,128,3) -- m
		end
		doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
		doPlayerRemoveItem(cid, 5878, 100)
		setPlayerStorageValue(cid,2435,1) -- Storage value to reflect quest done
	elseif getPlayerStorageValue(cid,2435) == 1 and getPlayerItemCount(cid,5878) >= 20 then
		doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
		doPlayerRemoveItem(cid, 5878, 20)
		doPlayerGiveItem(cid, 11244, 1)
	end	
	return TRUE
end