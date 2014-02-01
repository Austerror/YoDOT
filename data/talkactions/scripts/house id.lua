function onSay(cid, words, param, channel)
	pos = getPlayerPosition(cid)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "House ID: " .. getHouseFromPos(pos) .. ".")
	return true
end
