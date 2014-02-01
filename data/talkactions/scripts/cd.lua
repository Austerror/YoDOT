function onSay(cid, words, param, channel)
	local coolDown = getPlayerStorageValue(cid, 1338)
	local timeNow = os.time()
	local timeRem = 30 - math.floor((timeNow - coolDown) / 60)
	if (timeNow - coolDown) >= 1800 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your Hearth Stone is ready for use.')
	else
		if timeRem <= 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your Hearth Stone cooldown has 1 minute remaining.')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your Hearth Stone cooldown has ' .. timeRem .. ' minutes remaining.')
		end
	end
	return true
end
