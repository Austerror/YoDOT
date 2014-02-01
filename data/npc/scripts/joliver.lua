local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end
	dailyQuest = 2441 -- GSV (Global Quest Number)
	dailyDay = 2442 -- GSV (Global Quest Day)
	playersDailyQuest = 2440 -- PSV (Quest Number)
	playersDay = 2443 -- PSV (Players Day)
	playersDailyStatus = 2444 -- PSV (Quest Status)
	playerTrollDoorAccess = 2437 -- PSV Troll Door Access
	playerTrollBarrelsDestroyed = 2438 -- Number of barrels destroyed (default -1, 1,2,3)
	playerPatrickCakeDelivered = 2485 -- Cake delivered (-1 no, 1 yes)
	playerStewRetrieved = 2608 -- Player has retrieved stew from stove
	reinforcedCrowbar = 10153 -- Crowbar Id
	patricksCake = 6278 -- Patricks Cake Id
	rewardCrate = 11164 -- Reward Crate
	dailyText = {
		"Take this reinforced crowbar and head to the swamp troll cave. There you will find a sealed door, behind which are the trolls food stores. Destroy three of their food store barrels and return to me. Don\'t lose the crowbar or I will have to charge you 10,000 gold.",
		"Our beloved post master Patrick Sherrill has been having a rough time lately. Take him this cake in the hope that it will cheer him up a little.",
		"In Orcdom resides a strange wizard by the name of Nilrem. If you can find his hut you should be able to find some yielothax stew. Bring some back for me if you would be so kind.",
		"Daily 4 text"
	}
	
	if msgcontains(msg,'quest') then
		if playersDailyQuest == -1 then
			npcHandler:say('You are not on one of my {dailies}.',cid)
		elseif playersDailyQuest == 1 then
			npcHandler:say('You are on the destroy the trolls food stores {daily}.',cid)
		elseif playersDailyQuest == 2 then
			npcHandler:say('You are on cake for Patrick {daily}.',cid)
		elseif playersDailyQuest == 3 then
			npcHandler:say('You are on the yielothax stew {daily}.',cid)
		elseif playersDailyQuest == 4 then
			npcHandler:say('You are on the swamp fish {daily}.',cid)
		end
	end
	
	-- Dailes
	if msgcontains(msg,'daily') or msgcontains(msg,'dailies') then
		if math.abs(os.date("%j")) == getGlobalStorageValue(dailyDay) then -- last daily was set today.
			--	Nothing to do here
		else
			math.randomseed( os.time() )
			math.random(); math.random(); math.random()
			setGlobalStorageValue(dailyDay,os.date("%j")) -- set day of year for daily.
			setGlobalStorageValue(dailyQuest,math.random(1, 3)) -- set daily #.
		end
		
		if getPlayerStorageValue(cid,playersDailyStatus) == -1 then -- player is here to pick up daily.
			if getPlayerStorageValue(cid,playersDay) ~= getGlobalStorageValue(dailyDay) then -- player has not done todays daily.
				setPlayerStorageValue(cid,playersDay,os.date("%j")) -- Set player to todays doy.
				npcHandler:say(dailyText[getGlobalStorageValue(dailyQuest)],cid) -- NPC tell player what quest to do.
				setPlayerStorageValue(cid,playersDailyQuest,getGlobalStorageValue(dailyQuest)) -- Set Player to todays daily.
				setPlayerStorageValue(cid,playersDailyStatus,1) -- Set player to 'on quest'.
				-- Give req'd item to complete daily (if applicable)
				if getGlobalStorageValue(dailyQuest) == 1 then -- Player has been given 'Destroy Troll Food Store' daily (then give crowbar).
					doPlayerGiveItem(cid, reinforcedCrowbar,1) -- Give player reinforced crowbar.
					setPlayerStorageValue(cid,playerTrollDoorAccess,1) -- Grant Access to Troll Food Store Door.
				elseif getGlobalStorageValue(dailyQuest) == 2 then -- Player has been given Cake for Patrick daily (give them cake).
					doPlayerGiveItem(cid, patricksCake,1) -- Give player cake for Patrick.
				end
			else
				npcHandler:say('You have already done todays daily. Come back tomorrow for another.',cid) -- Advise player they have already completed todays daily.
			end
			
		elseif getPlayerStorageValue(cid,playersDailyStatus) == 1 then -- Player is on daily but hasn't completed.
			npcHandler:say('You haven\'t completed your daily yet, come back when you have.',cid) -- Advise player to complete quest then return.
		
		elseif getPlayerStorageValue(cid,playersDailyStatus) == 2 then -- Player is returning after completing daily.
			-- Check if player needs to return item before receiving reward.
			if getPlayerStorageValue(cid,playersDailyQuest) == 1 then -- Player is handing in troll food store daily and needs to return reinforced crowbar or pay 10,000, also set barrels broken and door access to -1.
				if doPlayerRemoveItem(cid, 10153, 1) == true then -- Player has returned WITH crowbar.
					npcHandler:say('Well done, take this crate as a reward. Perhaps you will find something useful inside.',cid)
					setPlayerStorageValue(cid,playerTrollBarrelsDestroyed,-1) -- Barrels to default (-1)
					setPlayerStorageValue(cid,playersDailyStatus,-1) -- Quest Status set to 'not picked up'.
					setPlayerStorageValue(cid,playerTrollDoorAccess,-1) -- Door access.
					doPlayerGiveItem(cid, rewardCrate,1) -- Reward
					doPlayerAddExp(cid,10000) -- give Exp
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effect
				elseif doPlayerRemoveMoney(cid, 10000) == true then -- Player has returned without crowbar but has 10k on them.
					npcHandler:say('Well done, take this crate as a reward. Perhaps you will find something useful inside. I have charged you 10,000 gold for not returning my crowbar. Be more careful next time.',cid)
					setPlayerStorageValue(cid,playerTrollBarrelsDestroyed,-1) -- Barrels to default (-1)
					setPlayerStorageValue(cid,playersDailyStatus,-1) -- Quest Status set to 'not picked up'.
					setPlayerStorageValue(cid,playerTrollDoorAccess,-1) -- Door access.
					doPlayerGiveItem(cid, rewardCrate,1) -- Reward
					doPlayerAddExp(cid,10000) -- give Exp
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effect
				else
					npcHandler:say('You have neither my crowbar nor 10,000 gold to compensate its loss. Either return my crowbar or pay 10,000 gold compensation or you will not being doing {dailies} for me anymore.',cid)
				end
			elseif getPlayerStorageValue(cid,playersDailyQuest) == 2 then -- Player is handing in Cake for Patrick (no items to reclaim).
				npcHandler:say('By the look of you the cake didn\'t cheer him up much. Take this crate as a reward, perhaps you will find something useful inside.',cid)
				setPlayerStorageValue(cid,playersDailyStatus,-1) -- Quest Status set to 'not picked up'.
				setPlayerStorageValue(cid,playerPatrickCakeDelivered,-1) -- Cake Delivered set back to -1 (default).
				doPlayerGiveItem(cid, rewardCrate,1) -- Reward
				doPlayerAddExp(cid,10000) -- give Exp
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effect
			elseif getPlayerStorageValue(cid,playersDailyQuest) == 3 then -- Player is handing in Yielothax Stew (Take Stew).
				if doPlayerRemoveItem(cid, 9992, 1) == true then
					npcHandler:say('Thank you for this. I\'ll see if I can\'t replicate my own version.',cid)
					setPlayerStorageValue(cid,playersDailyStatus,-1) -- Quest Status set to 'not picked up'.
					setPlayerStorageValue(cid,playerStewRetrieved,-1) -- Stew Retrieved set back to -1 (default).
					doPlayerGiveItem(cid, rewardCrate,1) -- Reward
					doPlayerAddExp(cid,10000) -- give Exp
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effect
				else
					npcHandler:say('I\'m hardly going to reward you for NOT bringing me the stew, now am I.',cid)
				end
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
