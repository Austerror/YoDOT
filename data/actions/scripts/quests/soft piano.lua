function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemWeight = 2.5
	local playerCap = getPlayerFreeCap(cid)	
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
	if math.abs(os.date("%j")) ~= getPlayerStorageValue(cid,2417) then
		if (math.random(1, 10) == 5) and (math.abs(os.date("%j")) ~= getPlayerStorageValue(cid,2417)) then
			doPlayerAddItem(cid, 2349, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a blue note.')
			setPlayerStorageValue(cid,2417,os.date("%j")) -- set day of year for daily
		end
	end
	doSendMagicEffect(fromPosition, CONST_ME_SOUND_BLUE)
	return true
end
