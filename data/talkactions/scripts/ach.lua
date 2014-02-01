function onSay(cid, words, param, channel)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have " .. getAccountPoints(cid) .. " Yodot Tokens.")
	return true
end