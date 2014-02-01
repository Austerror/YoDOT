function onUse(cid, item, fromPosition, itemEx, toPosition)
	local drunkTime = getPlayerStorageValue(cid,2601)
	local drunk = createConditionObject(CONDITION_DRUNK)
	setConditionParam(drunk, CONDITION_PARAM_TICKS, 60000)
	
	doCreatureSay(cid, "Glug!", TALKTYPE_ORANGE_1)
	doTargetCombatCondition(0, cid, drunk, CONST_ME_NONE)
	return TRUE
end