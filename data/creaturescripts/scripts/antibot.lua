local symbols = {"*", "^", "¿", "%", "&", "$"}
math.random(900, 1800)
local timeBetweenQuestion = math.random(3600, 7200)  -- 1 - 2 hours  --> old code (30 * 60 --30 minutes)
local timeToKick = 5 * 60 --5 minutes
local timeStorage = 65117
local codeStorage = 65118
local kickStorage = 65119
local timesStorage = 65121
local prisonPos = {x=1044,y=1063,z=5}

function onThink(cid, interval)
	if not isPlayer(cid) or getPlayerGroupId(cid) >= 3 then
		return
	end
 
	if getCreatureStorage(cid, timeStorage) < 1 then doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion) end
 
	if getCreatureStorage(cid, kickStorage) > 0 and os.time() >= getCreatureStorage(cid, kickStorage) then
		timeNow = os.time()
		jailTime = (timeNow + 1800)
		local tmp = {timeStorage, kickStorage, timesStorage, codeStorage}
		for i = 1, #tmp do
			doCreatureSetStorage(cid, tmp[i], 0)
	end
		return setPlayerStorageValue(cid, 1338, jailTime) and doTeleportThing(cid,prisonPos) and doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You have been sent to prison for one hour for not using !afk while not at keyboard. You may leave once your hearthstone is ready.") and setPlayerStorageValue(cid,65118,0)
	end
	if os.time() >= getCreatureStorage(cid, timeStorage) and getPlayerStorageValue(cid,38417) == 1 then -- Reset question timer to max if player is !afk
		doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion)
	end
	if os.time() >= getCreatureStorage(cid, timeStorage) and getPlayerVocation(cid) == 0 then -- Reset question timer to max if player is Rooker.
		doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion)
	end
	if os.time() >= getCreatureStorage(cid, timeStorage) and getPlayerStorageValue(cid,38417) ~= 1 then
		local code, set = "", 0
		set = math.random(1, 100000)
		local s, e = 1, 1
		for i = 1, string.len(set) do
			code = (code == "" and string.sub(set, s, e) or code .. symbols[math.random(#symbols)] .. string.sub(set, s, e))
			s, e = s + 1, e + 1
		end
 
		doCreatureSetStorage(cid, codeStorage, set)
		doCreatureSetStorage(cid, kickStorage, os.time() + timeToKick)
		doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion)
		pos = getCreaturePosition(cid)
		doSendMagicEffect(pos, CONST_ME_BATS)
		addEvent(antiBot, 3000, {player = cid})
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Please type !ab " .. code .. " without symbols (e.g. !ab 12345, not !ab 1#2$3%4^5). You have " .. timeToKick / 60 .. " minutes to comply.")
	end
	return
end

function antiBot(parameters)
	if isPlayer(parameters.player) == true then
		if getPlayerStorageValue(parameters.player,65118) ~= 0 then
			pos = getCreaturePosition(parameters.player)
			doSendMagicEffect(pos, CONST_ME_BATS)
			doCreatureSay(parameters.player,"Enter antibot code now!", TALKTYPE_ORANGE_1)
			addEvent(antiBot, 3000, {times = times, player = parameters.player})
		end
	end
end