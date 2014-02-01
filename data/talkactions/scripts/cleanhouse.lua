function onSay(cid, words, param, channel)
	if param == "" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "House ID required.")
	else
		doCleanHouse(param)
		setHouseOwner(param, 0)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "House cleaned and vacated.")
	end
	return true
end
