function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local pid = getPlayerByNameWildcard(param)
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end

	if (isInParty(cid) == true and getPartyLeader(cid) == cid) or isInParty(cid) == false then
	
		if isInParty(pid) == true then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player is already in a party.")
		else
			
			doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "You have been invited to a party by " .. getCreatureName(cid) .. ". Type /join " .. getCreatureName(cid) .. " to accept the invitation.")
		end
		
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are either not in a party or not the leader.")
	end
	return true
end
