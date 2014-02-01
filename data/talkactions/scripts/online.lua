function onSay(cid, words, param, channel)
	local strings, i, position, added, showGamemasters = {""}, 1, 1, false, getBooleanFromString(getConfigValue('displayGamemastersWithOnlineCommand'))
	for _, pid in ipairs(getPlayersOnline()) do
		if(added) then
			if(i > (position * 7)) then
				strings[position] = strings[position] .. ","
				position = position + 1
				strings[position] = ""
			else
				strings[position] = i == 1 and "" or strings[position] .. ", "
			end
		end

		added = false
		if((showGamemasters or getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES) or not getPlayerCustomFlagValue(pid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) and (not isPlayerGhost(pid) or getPlayerGhostAccess(cid) >= getPlayerGhostAccess(pid))) then
			if getPlayerStorageValue(pid,38417) == 1 then
				afkStatus = " -AFK"
			else
				afkStatus = ""
			end
			vocs = {"S","D","P","K","MS","ED","RP","EK","SS","FD","HP","FK","None"}
			vocID = getPlayerVocation(pid)
			if vocID == 0 then
				vocID = 13
			end
			strings[position] = strings[position] .. getCreatureName(pid) .. " [" .. getPlayerLevel(pid) .. " ".. vocs[vocID] .. "" .. afkStatus .. "]"
			i = i + 1
			added = true
		end
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (i - 1) .. " player" .. (i > 1 and "s" or "") .. " online:")
	for i, str in ipairs(strings) do
		if(str:sub(str:len()) ~= ",") then
			str = str .. "."
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, str)
	end

	return true
end
