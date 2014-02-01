local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	-- Antibot system start
	local timeStorage = 65117
	local codeStorage = 65118
	local kickStorage = 65119
	local timesStorage = 65121
	registerCreatureEvent(cid, "Antibot")
	doCreatureSetStorage(cid, codeStorage, 0)
	doCreatureSetStorage(cid, kickStorage, 0)
	doCreatureSetStorage(cid, timesStorage, 0)
	doCreatureSetStorage(cid, timeStorage, 0)
	-- Antibot system end
	-- Arena stuff start
	registerCreatureEvent(cid, "Arena")
	
	-- Arena stuff end
	
	-- Player don't drop loot start
	registerCreatureEvent(cid, "NoDrop")
	--Player don't drop loot end
	-- Login achievement
    if not playerHasAchievement(cid, 276) then
		doPlayerAddAchievement(cid, 276, true)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
	end
	--
	if getPlayerStorageValue(cid,2500) == -1 then -- Kill Count Quest Log
		setPlayerStorageValue(cid,2500,1)
	end
	if getPlayerStorageValue(cid,2401) == 1 then
		setPlayerStorageValue(cid,2401,2)
		doTeleportThing(cid,getPlayerMasterPos(cid))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You logged out during a task boss encounter and have been sent to the temple. You may enter the portal to start this encounter again if you didn\'t already kill it.")
	end
	if getPlayerStorageValue(cid,2401) == 3 then
		setPlayerStorageValue(cid,2401,2)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You died during a task boss encounter. You may enter the portal to start this encounter again if you didn\'t already kill it.")
	end
	if getPlayerStorageValue(cid,38417) == 1 then
		setPlayerStorageValue(cid,38417,-1)
	end
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) or (loss >=1) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildEvents")

	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "MonsterKills")
	-- registerCreatureEvent(cid, "PvP")
	-- registerCreatureEvent(cid, "PlayerDeath")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "AdvanceSave")
	return true
end
