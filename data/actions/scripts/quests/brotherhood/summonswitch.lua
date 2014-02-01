function onUse(cid, item, fromPosition, itemEx, toPosition)
	summonPos = {x = 1053, y = 1099, z = 10}
	hasDoneQuest = getPlayerStorageValue(cid,2377)
	brotherSummoned = getGlobalStorageValue(2378)
	if hasDoneQuest == -1 and brotherSummoned == -1 then
		doSummonCreature("Brother Daniel", summonPos)
		setPlayerStorageValue(cid,2377,1)
		setGlobalStorageValue(2378,1)
	end
	return true
end