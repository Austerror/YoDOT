function onSay(cid, words, param, channel)
	if (getCreatureCondition(cid, CONDITION_INFIGHT) == true) then
		doCreatureSay(cid,"I'm in a fight!!!!", TALKTYPE_ORANGE_1)
	elseif (getCreatureCondition(cid, CONDITION_INFIGHT) == false) then
		doCreatureSay(cid,"I'm not in a fight", TALKTYPE_ORANGE_1)
	end
	return true
end