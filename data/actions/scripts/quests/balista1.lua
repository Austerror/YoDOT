function onUse(cid, item, fromPosition, itemEx, toPosition)
	summonPos = {x = 1133, y = 1143, z = 4}
	if getPlayerStorageValue(cid, 2360) == -1 then
		doSummonCreature("Lethal Lissy", summonPos)
		setPlayerStorageValue(cid,2360,1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Nothing happens.')
	end
	return true
end
