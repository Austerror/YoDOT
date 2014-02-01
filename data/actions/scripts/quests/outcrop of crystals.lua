function onUse(cid, item, fromPosition, itemEx, toPosition)
	crystalsTimesTouched = getPlayerStorageValue(cid, 2618)
	if crystalsTimesTouched == -1 then
		crystalsTimesTouched = 0
	end


	if math.abs(os.date("%j")) == getPlayerStorageValue(cid,2619) then -- last time crystals were used was today
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The crystals resonate beautifully. The sound makes you want to return and hear it again tomorrow.')
	else
		if crystalsTimesTouched < 7 then -- Has touched crystals for 7 days
			setPlayerStorageValue(cid,2619,os.date("%j")) -- set day of year for crystal touched
			setPlayerStorageValue(cid,2618, crystalsTimesTouched + 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The crystals resonate beautifully. The sound makes you want to return and hear it again tomorrow.')
		elseif crystalsTimesTouched == 7 then
			doPlayerAddItem(cid, 13536, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The crystals resonate beautifully. A small piece falls in the shape of a diapason. You still feel compelled to return.')
			setPlayerStorageValue(cid,2618, 0)
		end
	end
	return true
end