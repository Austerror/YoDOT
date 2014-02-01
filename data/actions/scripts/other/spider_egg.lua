function onUse(cid, item, fromPosition)
	sackPos = getThingfromPos(fromPosition)
	if math.random(1, 100) <= 85 then
		doTransformItem(item.uid, 7536)
		doDecayItem(item.uid)
	else
		doSummonCreature("Giant Spider", fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_SMALLPLANTS)
		doTransformItem(item.uid, 7536)
		doDecayItem(item.uid)
	end
	
	return true
end