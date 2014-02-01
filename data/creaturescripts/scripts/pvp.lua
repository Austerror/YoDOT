function setPlayerPVPMode(uid, value)
	if (value >= 0 and value <= 1) then
		if isPlayer(uid) == TRUE then
			db.executeQuery("UPDATE `players` SET `pvp` = " .. value .. " WHERE `name`='" .. getPlayerName(uid) .. "' LIMIT 1;")
			return TRUE
		else
			return FALSE
		end
	else
		return FALSE
	end
end
 
 
function getPlayerPVPMode(uid)
  local result = db.getResult("SELECT `pvp` FROM `players` WHERE `name` = '" .. getPlayerName(uid) .. "' LIMIT 1;")
   if(result:getID() ~= -1) then
    local mode = result:getDataInt("pvp")
    return mode
   else
    return FALSE
   end
   result:free()
 end
 
function onCombat(cid, target)
    if (getPlayerPVPMode(cid) == 1 and getPlayerPVPMode(target) == 1) then
        return TRUE
	elseif isPlayer(target) == FALSE then
		return TRUE
	elseif target == cid then
		return TRUE
    elseif getPlayerPVPMode(cid) == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You cannot attack players with PvP disabled. Type !pvp \"on to enable.")
        return FALSE
    elseif getPlayerPVPMode(target) == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You cannot attack players that have PvP disabed.")
        return FALSE
    end
end