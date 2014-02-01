function onUse(cid, item, fromPosition, itemEx, toPosition)
	summonPos = {x = 1133, y = 1143, z = 4}
	if getPlayerStorageValue(cid, 2362) == -1 then
		doSummonCreature("Brutus Bloodbeard", summonPos)
		setPlayerStorageValue(cid,2362,1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Nothing happens.')
	end
	return true
end
