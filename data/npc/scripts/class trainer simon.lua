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
	
	playerLevel = getPlayerLevel(cid)
	if playerLevel <= 30 then
		blessCost = 5000
	elseif playerLevel > 30 and playerLevel < 120 then
		blessCost = (2000 + ((playerLevel - 30) * 200)) * 2.5
	else
		blessCost = 50000
	end
	
	if msgcontains(msg, 'bless') then
		talkState = 2
		
		npcHandler:say('Would you like me to bless you for ' .. blessCost .. ' gold?',cid)
	elseif msgcontains(msg,'yes') and talkState == 2 then
		if getPlayerBlessing(cid, 5) == FALSE then
			if getPlayerMoney(cid) >= blessCost then
				for i = 1,5 do
					doPlayerAddBlessing(cid, i)
				end
				doSendMagicEffect(getCreaturePosition(cid), 39)
				doPlayerRemoveMoney(cid, blessCost)
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYDAMAGE)
				npcHandler:say('You have been blessed by the gods!',cid)
			else
				npcHandler:say('Sorry, but you dont have ' .. blessCost .. ' gold.',cid)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			end
		else
			npcHandler:say('You are already blessed. The blessing will last until you die.',cid)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		end
		talkState = 0
	elseif not msgcontains(msg,'yes') and talkState == 2 then
		npcHandler:say('Perhaps another time then.',cid)
		talkState = 0
	elseif msgcontains(msg, 'bless') then
		npcHandler:say('I\'m sorry but I don\'t offer that service anymore.',cid)
	elseif msgcontains(msg,'wooden stake') then
		npcHandler:say('You seriously want me to bless a piece of wood??!?',cid)
		talkState = 11
	elseif msgcontains(msg,'yes') and talkState == 11 then
		npcHandler:say('Haha, okay then, if you insist... But I\'m going to have to charge to 10,000 gold to do this, do you still want me to do it?',cid)
		talkState = 12
	elseif msgcontains(msg,'yes') and talkState == 12 then
		if getPlayerItemCount(cid,5941) >= 1 then
			if doPlayerRemoveMoney(cid, 10000) then
				npcHandler:say('Here you are then, a blessed wooden stake, whatever you want it for... just don\'t tell me.',cid)
				doSendMagicEffect(getCreaturePosition(cid), 12)
				doPlayerRemoveItem(cid,5941,1)
				doPlayerAddItem(cid,5942,1)
				talkState = 0
			else
				npcHandler:say('You don\'t have 10,000 gold.',cid)
				talkState = 0
			end
		else
			npcHandler:say('You don\'t have a wooden stake for me to bless.',cid)
			talkState = 0
		end
	elseif msgcontains(msg,'wreckage') and getPlayerStorageValue(cid,2341) == 2 then
		npcHandler:say('Ah yes, more than likely pirates. There has been increased pirate activity of recent. Best you go back to Leruno and tell him about the {pirates}.',cid)
		setPlayerStorageValue(cid,2341,3)
	elseif msgcontains(msg,'target') or msgcontains(msg,'train') then
		if getPlayerStorageValue(cid,2377) == -1 then
			npcHandler:say('Defeat the one called Brother Daniel and take his scythe and cloak then I will let you train here.',cid)
		elseif getPlayerStorageValue(cid,2357) == 1 then
			npcHandler:say('You can train here.',cid)
		else
			npcHandler:say('You have defeated him and taken his scythe and cloak, well done. you maye now pass into the training room.',cid)
			setPlayerStorageValue(cid,2357,1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
		end
	elseif msgcontains(msg,'soft') then
		npcHandler:say('Would you like me to repair your worn soft boots for 10,000 gold?',cid)
		talkState = 13
	elseif msgcontains(msg,'yes') and talkState == 13 then
		if getPlayerItemCount(cid, 10021) >= 1 then
			if doPlayerRemoveMoney(cid, 10000) == true then
				npcHandler:say('Here you go, a fully charged pair of soft boots.',cid)
				doPlayerAddItem(cid,6132,1)
				doPlayerRemoveItem(cid,10021,1)
				talkState = 0
			else
				npcHandler:say('You do not have 10,000 gold for this.',cid)
				talkState = 0
			end
		else
			npcHandler:say('You do not have a worn pair of soft boots for me to recharge.',cid)
			talkState = 0
		end
	end
	if msgcontains(msg,'promot') then
		if getPlayerLevel(cid) <= 19 then
			npcHandler:say('You can\'t be promoted until level 20, and then again at level 150.',cid)
			talkState = 0
		elseif getPlayerPromotionLevel(cid) == 0 and getPlayerLevel(cid) >= 20 then
			npcHandler:say('Would you like me to promote you for 5000 gold coins?',cid)
			talkState = 21
		elseif getPlayerPromotionLevel(cid) == 1 and getPlayerLevel(cid) >= 150 then
			npcHandler:say('Would you like me to promote you for 50000 gold coins?',cid)
			talkState = 22
		elseif getPlayerPromotionLevel(cid) == 1 and getPlayerLevel(cid) <= 149 then
			npcHandler:say('I can\'t promote you again until you reach level 150.',cid)
			talkState = 0
		elseif getPlayerPromotionLevel(cid) == 2  then
			npcHandler:say('I can\'t promote you again.',cid)
			talkState = 0
		end
	end
	if msgcontains(msg, 'yes') and talkState == 21 then
		if doPlayerRemoveMoney(cid, 5000) == true then
			npcHandler:say('You are now promoted. Remember, you can gain another promotion at level 150.',cid)
			doPlayerSetPromotionLevel(cid, 1)
			talkState = 0
		else
			npcHandler:say('You do not have 5000 gold.',cid)
			talkState = 0
		end
	elseif msgcontains(msg, 'yes') and talkState == 22 then
		if doPlayerRemoveMoney(cid, 50000) == true then
			npcHandler:say('You are now promoted.',cid)
			doPlayerSetPromotionLevel(cid, 2)
			talkState = 0
		else
			npcHandler:say('You do not have 50000 gold.',cid)
			talkState = 0
		end
	end
	return true
end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
	shopModule:addBuyableItem({'platinum amulet'},	2171,	2000,	'platinum amulet')


--local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 5000 gold coins. Do you want me to promote you?'})
--	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 5000, level = 20, promotion = 1, text = 'Congratulations! You are now promoted.'})
--	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
