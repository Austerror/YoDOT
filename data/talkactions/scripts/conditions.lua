
function onSay(cid, words, param, channel)
	conditions = ""
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end


	local pid = getPlayerByNameWildcard(param)
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	else
		if getCreatureCondition(pid, CONDITION_FIRE) == true then
			conditions = conditions .. " Fire"
		end
		if getCreatureCondition(pid, CONDITION_ENERGY) == true then
			conditions = conditions .. " Energy"
		end
		if getCreatureCondition(pid, CONDITION_POISON) == true then
			conditions = conditions .. " Poison"
		end
		if getCreatureCondition(pid, CONDITION_FREEZING) == true then
			conditions = conditions .. " Freezing"
		end
		if getCreatureCondition(pid, CONDITION_DROWN) == true then
			conditions = conditions .. " Drown"
		end
		if getCreatureCondition(pid, CONDITION_BLEEDING) == true then
			conditions = conditions .. " Bleeding"
		end
		if getCreatureCondition(pid, CONDITION_DAZZLED) == true then
			conditions = conditions .. " Dazzled"
		end
		if getCreatureCondition(pid, CONDITION_CURSED) == true then
			conditions = conditions .. " Cursed"
		end
		if getCreatureCondition(pid, CONDITION_HASTE) == true then
			conditions = conditions .. " Haste"
		end
		if getCreatureCondition(pid, CONDITION_PARALYZE) == true then
			conditions = conditions .. " Paralyse"
		end
		if getCreatureCondition(pid, CONDITION_OUTFIT) == true then
			conditions = conditions .. " Outfit"
		end
		if getCreatureCondition(pid, CONDITION_LIGHT) == true then
			conditions = conditions .. " Light"
		end
		if getCreatureCondition(pid, CONDITION_REGENERATION) == true then
			conditions = conditions .. " Regeneration"
		end
		if getCreatureCondition(pid, CONDITION_SOUL) == true then
			conditions = conditions .. " Soul"
		end
		if getCreatureCondition(pid, CONDITION_MANASHIELD) == true then
			conditions = conditions .. " Manashield"
		end
		if getCreatureCondition(pid, CONDITION_ATTRIBUTES) == true then
			conditions = conditions .. " Attributes"
		end
		if getCreatureCondition(pid, CONDITION_INVISIBLE) == true then
			conditions = conditions .. " Invisible"
		end
		if getCreatureCondition(pid, CONDITION_HUNTING) == true then
			conditions = conditions .. " Hunting"
		end
		if getCreatureCondition(pid, CONDITION_INFIGHT) == true then
			conditions = conditions .. " Infight"
		end
		if getCreatureCondition(pid, CONDITION_MUTED) == true then
			conditions = conditions .. " Muted"
		end
		if getCreatureCondition(pid, CONDITION_EXHAUST) == true then
			conditions = conditions .. " Exhaust"
		end
		if getCreatureCondition(pid, CONDITION_DRUNK) == true then
			conditions = conditions .. " Drunk"
		end
		if getCreatureCondition(pid, CONDITION_PACIFIED) == true then
			conditions = conditions .. " Pacified"
		end
		if getCreatureCondition(pid, CONDITION_GAMEMASTER) == true then
			conditions = conditions .. " Gamemaster"
		end
		if getCreatureCondition(pid, CONDITION_SPELLCOOLDOWN) == true then
			conditions = conditions .. " Spellcooldown"
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, conditions)
	end
	
	return true
end
