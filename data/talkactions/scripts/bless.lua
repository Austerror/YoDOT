function onSay(cid, words, param, channel)
		if getPlayerBlessing(cid, 5) == FALSE then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You are not blessed!")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You are blessed!")
		end
		return true
end
