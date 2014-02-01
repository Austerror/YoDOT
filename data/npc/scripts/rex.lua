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
	if msgcontains(msg,'quest') then
		if getPlayerStorageValue(cid,2328) == -1 then
			npcHandler:say('You are not on one of my {dailies}.',cid)
		elseif getPlayerStorageValue(cid,2328) == 1 then
			npcHandler:say('You are on the oasis {daily}.',cid)
		elseif getPlayerStorageValue(cid,2328) == 2 then
			npcHandler:say('You are on the minotaur {daily}.',cid)
		elseif getPlayerStorageValue(cid,2328) == 3 then
			npcHandler:say('You are on the Frostrend geysor {daily}.',cid)
		elseif getPlayerStorageValue(cid,2328) == 4 then
			npcHandler:say('You are on the swamp fish {daily}.',cid)
		end
	end
	
	if msgcontains(msg,'gm info') then
		npcHandler:say('Daily ID: ' .. getGlobalStorageValue(2326) .. '. Players Daily: ' .. getPlayerStorageValue(cid,2328) .. '. Daily Day (DOY): ' .. getGlobalStorageValue(2327) .. '. Players Daily (DOY): ' .. getPlayerStorageValue(cid,2331) .. '. Players Daily Status: ' .. getPlayerStorageValue(cid,2329) .. '. os.date: ' .. os.date("%j"),cid)
	end
	-- Dailes
	if msgcontains(msg,'daily') or msgcontains(msg,'dailies') then
		if math.abs(os.date("%j")) == getGlobalStorageValue(2327) then -- last daily was set today
			--	Nothing to do here
		else
			math.randomseed( os.time() )
			math.random(); math.random(); math.random()
			setGlobalStorageValue(2327,os.date("%j")) -- set day of year for daily
			setGlobalStorageValue(2326,math.random(1, 4)) -- set daily #
		end
		playersDaily = getPlayerStorageValue(cid,2328) -- players daily #
		playersDailyDOY = getPlayerStorageValue(cid,2331) -- players day of year daily
		playersDailyStatus = getPlayerStorageValue(cid,2329) -- status of players daily (1 - on, 2 - completed, 3- handed in)
		dailyID = getGlobalStorageValue(2326) -- todays daily #

		if playersDailyStatus == 1 then -- player is on daily but hasn't completed it
			npcHandler:say('You haven\'t completed your {quest} yet.',cid)
		elseif playersDailyStatus == 2 then -- player has completed quest and has returned to hand in
			if playersDaily == 1 then -- player is handing in daily #1 OASIS
				if getPlayerStorageValue(cid,2330) >= 10 then -- player has caught 10 ranbow trout
					if doPlayerRemoveItem(cid,7158,10) then -- player had the 10 trout on them and handed them in
						npcHandler:say('Good job. Here, take this bag as a reward. Maybe you\'ll find something good inside.',cid)
						doPlayerAddItem(cid,13827,1) -- give player rewards bag
						doPlayerAddExp(cid,10000) -- give Exp
						doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
						doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effet
						setPlayerStorageValue(cid,2329,-1) -- set the daily status back to -1 (not picked up)
						setPlayerStorageValue(cid,2330,-1) -- set the number of rainbows caught back to none (-1, fishing.lua compensates for this) !END
					else
						npcHandler:say('You don\'t have the 10 trout on you.',cid) -- player has caught the fish but doesn't have them in BP !END
					end
				else
					npcHandler:say('You haven\'t caught 10 trout yet.',cid) -- player hasn't caught 10 trout !END
				end
			elseif playersDaily == 2 then -- player is handing in daily #2 MINOTAURS
				if getPlayerStorageValue(cid,2332) == 1 and getPlayerStorageValue(cid,2333) == 1 and getPlayerStorageValue(cid,2334) == 1 and getPlayerStorageValue(cid,2335) == 1 and getPlayerStorageValue(cid,2336) == 1 then -- player has burned all 5 nets
					
					if doPlayerRemoveItem(cid,9956,1) then
							npcHandler:say('Good job. Here, take this bag as a reward. Maybe you\'ll find something good inside.',cid)
							doPlayerAddItem(cid,13827,1) -- give player rewards bag
							doPlayerAddExp(cid,10000) -- give Exp
							doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
							doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effet
							setPlayerStorageValue(cid,2329,-1) -- set the daily status back to -1 (not picked up)
							setPlayerStorageValue(cid,2332,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2333,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2334,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2335,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2336,-1) -- burned net back to unburned
					elseif doPlayerRemoveMoney(cid,5000) then -- remove torch.
							npcHandler:say('Good job. I have charged you 5,000 gold for losing my torch. Be more careful next time. Here, take this bag as a reward. Maybe you\'ll find something good inside.',cid)
							doPlayerAddItem(cid,13827,1) -- give player rewards bag
							doPlayerAddExp(cid,10000) -- give Exp
							doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
							doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effet
							setPlayerStorageValue(cid,2329,-1) -- set the daily status back to -1 (not picked up)
							setPlayerStorageValue(cid,2332,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2333,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2334,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2335,-1) -- burned net back to unburned
							setPlayerStorageValue(cid,2336,-1) -- burned net back to unburned				else
					else
						npcHandler:say('As you\'e lost my torch you\'re going to have to pay me 5,000 gold before I am going to let you do any more dailies.',cid)
					end					
				else
					npcHandler:say('You haven\'t burned all 5 nets. Come back when you have.',cid) -- player hasn't burned 5 nets !END
				end
			elseif playersDaily == 3 then -- player is handing in daily #3 Frostrend geysor
				if doPlayerRemoveItem(cid,13944,1) then
					npcHandler:say('Good job. Here, take this bag as a reward. Maybe you\'ll find something good inside.',cid)
					doPlayerAddItem(cid,13827,1) -- give player rewards bag
					doPlayerAddExp(cid,10000) -- give Exp
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effect
					setPlayerStorageValue(cid,2329,-1) -- set the daily status back to -1 (not picked up)
				else
					npcHandler:say('You don\'t have the bloated steam belly on you.',cid)
				end
			elseif playersDaily == 4 then -- player is handing in daily #4 SWAMP FISH
				npcHandler:say('Good job. Here, take this bag as a reward. Maybe you\'ll find something good inside.',cid)
				doPlayerAddItem(cid,13827,1) -- give player rewards bag
				doPlayerAddExp(cid,10000) -- give Exp
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 experience.") -- Show Exp
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN) -- Magic effet
				setPlayerStorageValue(cid,2329,-1) -- set the daily status back to -1 (not picked up)
			end
		elseif getPlayerStorageValue(cid,2329) == -1 then -- player has completed todays daily #
			if getPlayerStorageValue(cid,2331) == getGlobalStorageValue(2327) then -- player has completed todays daily today
				npcHandler:say('You have already done this quest today. Come back tomorrow for another.',cid) -- player has done todays daily !END
			else -- player completed todays daily # another time and is eligible to pick up todays quest
				if dailyID == 1 then -- OASIS Daily
					npcHandler:say('Head to the oasis south west of town and catch me 10 rainbow trout. Come back when you have done this.',cid)
					setPlayerStorageValue(cid,2331,os.date("%j")) -- set players DOY daily to todays DOY
					setPlayerStorageValue(cid,2329,1)
				elseif dailyID == 2 then -- MINOTAUR NETS Daily
					npcHandler:say('Head to the minotaurs east of town and burn 5 of their nets with my torch. If you lose my torch I\'ll have to charge to 5,000 gold so be careful. Come back when you have done this.',cid)
					setPlayerStorageValue(cid,2331,os.date("%j")) -- set players DOY daily to todays DOY
					doPlayerAddItem(cid,9956,1) -- give player Rex's torch to burn nets
					setPlayerStorageValue(cid,2329,1)
				elseif dailyID == 3 then -- FROSTREND geysor Daily
					npcHandler:say('Head to Frostrend through the portal on the wharf next to us. When you arrive I want you to fish from the geysor just east of the warf until you catch a bloated steam belly for me. Come back when you have caught one.',cid)
					setPlayerStorageValue(cid,2331,os.date("%j")) -- set players DOY daily to todays DOY
					setPlayerStorageValue(cid,2329,1)
				elseif dailyID == 4 then -- SWAMP FISH Daily
					npcHandler:say('Take this little swamp fish here and release him into any swamp you come across. If you lose the swamp fish I\'ll have to charge you 5,000 gold before I can trust you with another quest. Return to me when you have done this.',cid)
					setPlayerStorageValue(cid,2331,os.date("%j")) -- set players DOY daily to todays DOY
					doPlayerAddItem(cid,13546,1) -- give player swamp fish
					setPlayerStorageValue(cid,2329,1)
				end
				setPlayerStorageValue(cid,2328,dailyID) -- set player to todays daily #
			end
		end
	end
	-- Abandoning Previous Daily
	if msgcontains(msg,'abandon') and getPlayerStorageValue(cid,2329) == 1 then -- player has picked up daily but hasn't performed it.
		if getPlayerStorageValue(cid,2331) ~= getGlobalStorageValue(2327) then -- Player is not on this DOY Daily so can abandon.
			if getPlayerStorageValue(cid,2328) == 2 then -- Had minotaur task, better take torch back!
				if doPlayerRemoveItem(cid,9956,1) then
					npcHandler:say('There you go. I have taken you off your previous {daily}.',cid)
					setPlayerStorageValue(cid, 2331, 0) -- sets players DOY to 0
					setPlayerStorageValue(cid,2329, -1) -- sets players daily status to -1 (not picked up)
				elseif doPlayerRemoveMoney(cid,5000) then -- remove torch.
					npcHandler:say('There you go. I have taken you off your previous {daily}. Because you lost my torch I\'ve charged you 5,000 gold. Be more careful next time.',cid)
					setPlayerStorageValue(cid, 2331, 0) -- sets players DOY to 0
					setPlayerStorageValue(cid,2329, -1) -- sets players daily status to -1 (not picked up)
				else
					npcHandler:say('As you\'e lost my torch you\'re going to have to pay me 5,000 gold before I am going to let you do any more dailies.',cid)
				end
			elseif getPlayerStorageValue(cid,2328) == 4 then  -- Had Swamp fish task, better take fish back.
				if doPlayerRemoveItem(cid,13546,1) then -- remove fish
					npcHandler:say('There you go. I have taken you off your previous {daily}.',cid)
					setPlayerStorageValue(cid, 2331, 0) -- sets players DOY to 0
					setPlayerStorageValue(cid,2329, -1) -- sets players daily status to -1 (not picked up)
				elseif doPlayerRemoveMoney(cid,5000) then -- remove 5k for losing fish
					npcHandler:say('There you go. I have taken you off your previous {daily}. Because you lost my torch I\'ve charged you 5,000 gold. Be more careful next time.',cid)
					setPlayerStorageValue(cid, 2331, 0) -- sets players DOY to 0
					setPlayerStorageValue(cid,2329, -1) -- sets players daily status to -1 (not picked up)
				else
					npcHandler:say('As you\'e lost the swamp fish you\'re going to have to pay me 5,000 gold before I am going to let you do any more dailies.',cid)
				end			
			else
				npcHandler:say('There you go. I have taken you off your previous {daily}.',cid)
				setPlayerStorageValue(cid, 2331, 0) -- sets players DOY to 0
				setPlayerStorageValue(cid,2329, -1) -- sets players daily status to -1 (not picked up)
			end
		else
			npcHandler:say('You can not abandon the current daily. Come back tomorrow and try again.',cid)
		end
	elseif msgcontains(msg,'abandon') and getPlayerStorageValue(cid,2329) == -1 then
		npcHandler:say('You can not abandon a {daily} if you are not on one.',cid)
	elseif msgcontains(msg,'abandon') and getPlayerStorageValue(cid,2329) == 2 then
		npcHandler:say('I can not let you abandon a completed daily, instead you should hand this {daily} in.',cid)
	end
	-- Beggar Outfit. Required items: 10 Blood Herbs, 10 Minotaur Leather
	if msgcontains(msg, 'outfit') then -- Player has asked for Outfit
		if (canPlayerWearOutfit(cid, 153) or canPlayerWearOutfit(cid, 157)) then -- Can wear outfit already
			npcHandler:say('Yes, it suits you.',cid)
			talkState = 0
		else -- Can't wear outfit. Tell player requirements and give keyword.
			npcHandler:say('If you give me 10 blood herbs and 10 pieces of minotaur leather I can give you the beggar outfit. Sound like a {deal}?',cid)
			talkState = 11
		end
	elseif msgcontains(msg,'deal') and talkState == 11 then
		if (doPlayerTakeItem(cid, 2798, 10) and doPlayerTakeItem(cid, 5878, 10)) then -- Has items to take.
			npcHandler:say('There you go, the beggar outfit as promissed.',cid)
			doPlayerAddOutfit(cid,153, 0)
			doPlayerAddOutfit(cid,157, 0)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED) -- Magic effect
			talkState = 0
		else -- Player doesn't have items.
			npcHandler:say('You don\'t have all the items.',cid)
			talkState = 0
		end
	end
	--
	-- Beggar Outfit. (Beard Addon) Required items: 25 Ape Fur, 10 Honeycomb
	if (msgcontains(msg, 'beard') or msgcontains(msg, 'dress')) then -- Player has asked for beard/dress addon
		if (canPlayerWearOutfit(cid, 153) or canPlayerWearOutfit(cid, 157)) then -- Can wear outfit.
			if (canPlayerWearOutfit(cid, 153, 1) or canPlayerWearOutfit(cid, 157, 1)) then -- Check if player already has addon
				npcHandler:say('You already have this addon',cid)
				talkState = 0
			else --Tell player requirements and give keyword.
				if (getPlayerSex(cid) == 1) then
					npcHandler:say('If you give me 25 pieces of {ape fur} and 10 chunks of {honeycomb} I can give you the beggar beard. Sound like a {deal}?',cid)
				else
					npcHandler:say('If you give me 25 pieces of {ape fur} and 10 chunks of {honeycomb} I can give you the beggar dress. Sound like a {deal}?',cid)
				end
				talkState = 12
			end
		else -- Can't wear outfit. Tell player they need beggar outfit.
			npcHandler:say('I\'m sorry, but the beard is only available to players who have the beggar outfit.',cid)
			talkState = 0
		end
	elseif msgcontains(msg,'deal') and talkState == 12 then
		if (doPlayerTakeItem(cid, 5883, 25) and doPlayerTakeItem(cid, 5902, 10)) then -- Has items to take.
			if (getPlayerSex(cid) == 1) then
				npcHandler:say('There you go, the beggar beard as promissed?',cid)
			else
				npcHandler:say('There you go, the beggar dress as promissed',cid)
			end
			doPlayerAddOutfit(cid,153, 1)
			doPlayerAddOutfit(cid,157, 1)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED) -- Magic effect
			talkState = 0
		else -- Player doesn't have items.
			npcHandler:say('You don\'t have all the items.',cid)
			talkState = 0
		end
	end
	--
	-- Training
	fishingProf = getPlayerStorageValue(cid, 2317)
	fishingSkill = getPlayerSkill(cid, SKILL_FISHING)
	if msgcontains(msg, 'fish') then
		if fishingProf == -1 then
			npcHandler:say('Would you like to learn the rookie fishing skill for 50 gold?',cid)
			talkState = 1
		elseif fishingProf == 1 and fishingSkill < 30 then
			npcHandler:say('When you reach fishing skill 30 I can teach you the intermediate fishing skill.',cid)
		elseif fishingProf == 1 and fishingSkill == 30 then
			npcHandler:say('Would you like to learn the intermediate fishing skill for 100 gold?',cid) 
			talkState = 2
		elseif fishingProf == 2 and fishingSkill < 60 then
			npcHandler:say('When you reach fishing skill 60 I can teach you the expert fishing skill.',cid)
		elseif fishingProf == 2 and fishingSkill == 60 then
			npcHandler:say('Would you like to learn the expert fishing skill for 500 gold?',cid) 
			talkState = 3
		elseif fishingProf == 3 and fishingSkill <= 90 then
			npcHandler:say('You can not learn a higher rank than expert, well done.',cid)
		end
	end
	if msgcontains(msg,'yes') and talkState == 1 then
		if doPlayerRemoveMoney(cid, 50) then
			setPlayerStorageValue(cid,2317,1)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			npcHandler:say('There you go. If you haven\'t done so, ask me about a {daily}.',cid)
		else
			npcHandler:say('You do not have enough money.',cid) 
		end
		talkState = 0
	elseif msgcontains(msg,'yes') and talkState == 2 then
		if doPlayerRemoveMoney(cid, 100) then
			setPlayerStorageValue(cid,2317,2)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			npcHandler:say('There you go. If you haven\'t done so, ask me about a {daily}.',cid)
		else
			npcHandler:say('You do not have enough money.',cid) 
		end
		talkState = 0
	elseif msgcontains(msg,'yes') and talkState == 3 then
		if doPlayerRemoveMoney(cid, 500) then
			setPlayerStorageValue(cid,2317,3)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			npcHandler:say('There you go. If you haven\'t done so, ask me about a {daily}.',cid)
		else
			npcHandler:say('You do not have enough money.',cid) 
		end
		talkState = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
