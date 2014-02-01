function onSay(cid, words, param, channel)
	local buffEnds = getPlayerStorageValue(cid, 2347)
	local timeNow = os.time()

	if timeNow > buffEnds then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your buff has expired.')
	else
		timeRem = math.ceil(((buffEnds - timeNow) / 60))
		if timeRem <= 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your food buff will expire in 1 minute.')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Your food buff will expire in ' .. timeRem .. ' minutes.')
		end
	end
	return true
end
