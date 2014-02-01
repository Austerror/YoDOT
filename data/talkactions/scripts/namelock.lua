function onSay(cid, words, param)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "/namelock Player Name")
		return true
	end

	--local t = string.explode(param, ",")
	--if(not t[2]) then
		--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Not enough params.")
		--return true
	--end

	local pid = getPlayerByNameWildcard(param)
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end
	doAddPlayerBanishment(param, PLAYERBAN_BANISHMENT, os.time() + 1 * 24 * 60 * 60, 23, ACTION_NAMEREPORT, "Namelocked!")
	return true
end
