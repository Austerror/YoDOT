function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,2377) <= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received the brotherhood addons.")
		if getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid,279,3) -- f
		else
			doPlayerAddOutfit(cid,278,3) -- m
		end
		doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
		setPlayerStorageValue(cid,2377,2) -- Storage value to reflect quest done (same as summon switch value)
	end
end