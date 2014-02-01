local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end


	if (msgcontains(msg, 'chef') or msgcontains(msg, 'cook')) and getPlayerStorageValue(cid,2345) == -1 then
		npcHandler:say('Would you like to become a chef for 50 gold?', cid)
		talkState = 1
	elseif msgcontains(msg,'yes') and talkState == 1 then
		if doPlayerRemoveMoney(cid,50) then
			npcHandler:say('There you go, I have taught you the cooking skill. I\'ll also give you this chefs rolling pin, you will need it to do any cooking. Any cooking you do will have to be done standing next to those ovens in the rooms next to us. You can {trade} most of the ingredients you will need from me. If you lose your chefs rolling pin I can also sell you another one of those. At any time you want to know what you can {cook} just ask me.',cid)
			doPlayerAddItem(cid,13928,1)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			setPlayerStorageValue(cid,2345,1)
		else
			npcHandler:say('I\'m very sorry but you don\'t seem to have 50 gold on you.', cid)
		end
		talkState = 0
	elseif talkState == 1 then
		npcHandler:say('Another time perhaps.', cid)
		talkState = 0
	elseif (msgcontains(msg, 'chef') or msgcontains(msg, 'cook')) and getPlayerStorageValue(cid,2345) == 1 then
		npcHandler:say('As a chef you can cook buff food, for which I sell the ingredients for, also, you can cook other food into rice balls. Rice balls weigh less than most food and provide quite good sustinance. You can cook 1x swamp grass into 1 rice ball, 5 blueberries into 1 rice ball, 3 fish into 1 rice ball, 3 meat into 1 rice ball and 2 ham into 1 rice ball. Cooking buff food costs 25 soul points, all other food costs 5 soul points each to cook.',cid)
	elseif msgcontains(msg, 'rice') then
		npcHandler:say('Would you like to trade a bunch of ripe rice for 10 rice balls?', cid)
		talkState = 2
	elseif msgcontains(msg,'yes') and talkState == 2 then
		if getPlayerItemCount(cid,11245) >= 1 then
			doPlayerAddItem(cid,11246,10)
			doPlayerRemoveItem(cid,11245,1)
			npcHandler:say('Here you are, 10 rice balls.', cid)
			talkState = 0
		else
			npcHandler:say('You don\'t have any bunches of ripe rice.', cid)
			talkState = 0
		end
	end
end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Sellable
-- shopModule:addSellableItem({'flask'}, 		7636, 5,	'flask')

-- Buyable
--shopModule:addBuyableItem({'ingredients for mana cakes'},	13540, 100,	'ingredients for mana cakes')
shopModule:addBuyableItem({'ingredients for shield cakes'},	13541, 100,	'ingredients for shield cakes')
shopModule:addBuyableItem({'ingredients for power cakes'},	13543, 100,	'ingredients for power cakes')
--shopModule:addBuyableItem({'ingredients for health cakes'},	13544, 100,	'ingredients for health cakes')
shopModule:addBuyableItem({'ingredients for magic cakes'},	13545, 100,	'ingredients for magic cakes')
shopModule:addBuyableItem({'chefs rolling pin'},			13928, 1000,	'chefs rolling pin')
-- **********
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())