function onUse(cid, item, fromPosition, itemEx, toPosition)
	local temple = getPlayerMasterPos(cid) -- Dont touch
	if getCreatureCondition(cid, CONDITION_INFIGHT) == false then
		local coolDown = getPlayerStorageValue(cid, 1338)
		local timeNow = os.time()
		if (timeNow - coolDown) >= 1800 then
			addEvent(telePlayer, 10000, {player = cid, dest = temple})
			addEvent(teleCount, 2000, {player = cid, times = 8})
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE,"You will be teleported in 10 seconds if you stay out of battle.")
			doCreatureSay(cid,"Teleporting in 10 seconds.", TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 12585)
			doDecayItem(item.uid)
		else
			local timeRem = 30 - math.floor((timeNow - coolDown) / 60)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your Hearth Stone is on cooldown (' .. timeRem .. ' minutes remaining).')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You can\'t use this rune while you have battle signs.')
	end
	return true
end

function teleCount(parameters)
	if isPlayer(parameters.player) == true then
	pos = getCreaturePosition(parameters.player)
		if getCreatureCondition(parameters.player, CONDITION_INFIGHT) == false then
			if parameters.times >= 1 then
				doSendMagicEffect(pos, 11)
				doCreatureSay(parameters.player,"Teleporting in " .. parameters.times .. " seconds.", TALKTYPE_ORANGE_1)
				times = parameters.times - 2
				addEvent(teleCount, 2000, {times = times, player = parameters.player})
			end
		else
			doPlayerSendTextMessage(parameters.player, MESSAGE_INFO_DESCR, 'You can\'t teleport while you have battle signs.')
		end
	end
end

function telePlayer(parameters)
	if isPlayer(parameters.player) == true then
		if getCreatureCondition(parameters.player, CONDITION_INFIGHT) == false then
			doTeleportThing(parameters.player,parameters.dest)
			local coolDown = os.time()
			setPlayerStorageValue(parameters.player, 1338, coolDown)
			doSendMagicEffect(parameters.dest, 10)
			doCreatureSay(parameters.player,"Teleport!", TALKTYPE_ORANGE_1)
		end
	end 
	return true
end