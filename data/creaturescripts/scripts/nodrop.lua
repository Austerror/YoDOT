local corpse_ids = {
	[0] = 3065,
	[1] = 3058
}

function onPrepareDeath(cid, deathList)
doPlayerSetLossPercent(cid, PLAYERLOSS_CONTAINERS, 0)
doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 0)
	--doCreatureSetDropLoot(cid, false)

	-- DO NOT EDIT BELOW --
	--for i = 1, #deathList do
	--	local corpse, killers = doCreateItem(corpse_ids[getPlayerSex(cid)], 1, getThingPos(cid)), ""
	--	for i = 1, math.min(getConfigInfo('deathAssistCount') + 1, #deathList) do
	--		killers = killers .. (i == 1 and "" or ", ") .. (isMonster(deathList[i]) and "a " or "") .. getCreatureName(deathList[i])
	--	end
	--end
	return true
end