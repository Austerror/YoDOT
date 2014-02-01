function onStepIn(cid, item, position, fromPosition)
	if not playerHasAchievement(cid, 277) then
		doPlayerAddAchievement(cid, 277, true)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
	end
	return TRUE
end