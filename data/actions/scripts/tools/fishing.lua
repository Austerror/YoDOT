local waterIds = {4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}
local fished = {4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	-- Training Values
	fishingProfSV = 2317
	fishingProf = getPlayerStorageValue(cid, fishingProfSV)
	-- Daily Values
	dailyIdSV = 2326
	dailyId = getGlobalStorageValue(cid, dailyIdSV)
	dayOfYearSV = 2327
	dayOfYear = getGlobalStorageValue(cid, dayOfYearSV)
	playersDailySV = 2328
	playersDaily = getPlayerStorageValue(cid, playersDailySV)
	playersDailyStatusSV = 2329
	playersDailyStatus = getPlayerStorageValue(cid, playersDailyStatusSV)
	rainbowsCaughtSV = 2330
	rainbowsCaught = getPlayerStorageValue(cid, rainbowsCaughtSV)
	-- General Fishing.
	if getTilePzInfo(getCreaturePosition(cid)) ~= TRUE then
		if isInArray(waterIds, itemEx.itemid) == TRUE then
			if getPlayerStorageValue(cid,2317) == -1 then -- Doesn't know fishing
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need to learn that skill.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			else
				if isInArray(fished, itemEx.itemid) ~= TRUE then
					if math.random(1, (90 + (getPlayerSkill(cid, SKILL_FISHING) * 3))) <= getPlayerSkill(cid, SKILL_FISHING) then
						doPlayerAddItem(cid, 2667, 1)
						doTransformItem(itemEx.uid, (itemEx.itemid + 9))
						doDecayItem(itemEx.uid)
					end
					if getPlayerSkill(cid, SKILL_FISHING) <= ((fishingProf * 30) - 1) then
						doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
					end
				end
				doSendMagicEffect(toPosition, CONST_ME_LOSEENERGY)
			
			end
			-- Dailies
			-- --Oasis
			-- doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, playersDaily .. " " .. playersDailyStatus)
			if itemEx.actionid == 2320 then -- Oasis water tiles
				if playersDaily == 1 and playersDailyStatus == 1 then -- is on Daily #1 and hasn't caught 10.
					if math.random(1, (250 + getPlayerSkill(cid, SKILL_FISHING))) <= getPlayerSkill(cid, SKILL_FISHING) then
						doPlayerAddItem(cid, 7158, 1)
						if rainbowsCaught == -1 then
							setPlayerStorageValue(cid, rainbowsCaughtSV, 1)
						else
							setPlayerStorageValue(cid, rainbowsCaughtSV, (rainbowsCaught + 1))
						end
						doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
						if getPlayerStorageValue(cid, rainbowsCaughtSV) == 10 then
							setPlayerStorageValue(cid, playersDailyStatusSV,2)
						end
					end
				end
			end
			-- -- End Oasis.
		end
		if itemEx.actionid == 2337 then -- player is fishing in geisor
			if getPlayerStorageValue(cid,2328) == 3 and getPlayerStorageValue(cid,2329) == 1 then -- player on daily and hasn't completed
				if math.random(1, (500 + getPlayerSkill(cid, SKILL_FISHING))) <= getPlayerSkill(cid, SKILL_FISHING) then
					doPlayerAddItem(cid, 13944, 1)
					setPlayerStorageValue(cid,2329,2) -- set that player has recieved fish.
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You caught the bloated steam belly. It\'s time to turn to Rex.")
				end
				doSendMagicEffect(toPosition, CONST_ME_BUBBLES)
			end
		end
		if itemEx.itemid == 10499 then
		math.randomseed( os.time() )
		math.random(); math.random(); math.random()
		local contents = math.random(1, 1000)
			if contents >= 995 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a giant shimmering pearl.')
				doPlayerAddItem(cid, 7632)
			elseif contents >= 990 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a giant shimmering pearl.')
				doPlayerAddItem(cid, 7633)
			elseif contents >= 985 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a small diamond.')
				doPlayerAddItem(cid, 2145)
			elseif contents >= 980 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a life ring.')
				doPlayerAddItem(cid, 2168)
			elseif contents >= 975 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a white pearl.')
				doPlayerAddItem(cid, 2143)
			elseif contents >= 970 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a small sapphire.')
				doPlayerAddItem(cid, 2146)
			elseif contents >= 969 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You received a leviathan\'s amulet.')
				doPlayerAddItem(cid, 10220)
			elseif contents >= 0 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'It was empty.')
			end
			doTransformItem(itemEx.uid, 10500)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You can\'t fish from within a protection zone.")
	end
return true
end