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
	
	local potions = { 
                  {id=8473, buy=175, sell=0, name="ultimate health potion"},
				  {id=8472, buy=110, sell=0, name="great spirit potion"},
				  {id=7591, buy=110, sell=0, name="great health potion"},
				  {id=7588, buy=55, sell=0, name="strong health potion"},
				  {id=7618, buy=20, sell=0, name="health potion"},
				  {id=7590, buy=110, sell=0, name="great mana potion"},
				  {id=7589, buy=55, sell=0, name="strong mana potion"},
				  {id=7620, buy=20, sell=0, name="mana potion"},
                  }
	local items = {}  
		for _, item in ipairs(potions) do 
		items[item.id] = {storage = item.storage, item_id = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name} 
	end 

	local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)  
	    if items[item].buyPrice ~= 0 then  
	        doPlayerRemoveMoney(cid, amount * items[item].buyPrice)  
	            doPlayerAddItem(cid, items[item].item_id, amount)  
	    end 
	end 
	    
	local onSell = function(cid, item, subType, amount, ignoreCap, inBackpacks)  
	    if items[item].sellPrice ~= 0 then  
	        doPlayerAddMoney(cid, items[item].sellPrice * amount)  
	        doPlayerRemoveItem(cid, items[item].item_id, amount)  
	        npcHandler:say("You sold "..amount.." "..items[item].realName.." for "..items[item].sellPrice * amount.." gold coins.", cid)  
        end 
    end 
    if msgcontains(msg, 'potions') or msgcontains(msg, 'pots') then  
		openShopWindow(cid, potions, onBuy, onSell) 
		npcHandler:say("Here's my offer.", cid) 
    end
	
	local belt = 2314
	local cape = 2611
	if (msgcontains(msg, 'lottery') or msgcontains(msg, 'ticket')) then
		npcHandler:say('Would you like to exchange 100 empty flasks for a lottery ticket?', cid)
		talkState = 1
	elseif msgcontains(msg, 'yes') and talkState == 1 then
		if doPlayerRemoveItem(cid, 7636,100) or doPlayerRemoveItem(cid, 7635,100) or doPlayerRemoveItem(cid, 7634,100) then
			npcHandler:say('Here\'s your ticket. Good luck!', cid)
			doPlayerAddItem(cid, 5957, 1)
		else
			npcHandler:say('Sorry you need 100 empty flasks to exchange for the lottery ticket', cid)
			talkState = 0
		end
	elseif msgcontains(msg, 'no') and (talkState >= 1 and talkState <= 3) then
		npcHandler:say('Maybe next time.', cid)
		talk_state = 0
	elseif msgcontains(msg, 'belt') then
		npcHandler:say('Would you like to exchange a winning lottery ticket for the fluid belt addon?', cid)
		talkState = 11
	elseif msgcontains(msg, 'yes') and talkState == 11 then
		addon = getPlayerStorageValue(cid, belt)
		if addon == -1 then
			if getPlayerSex(cid) == 1 then
				if getPlayerItemCount(cid,5958) >= 1 then
					doPlayerRemoveItem(cid,5958,1)
					npcHandler:say('Congratulations, here is your fluid belt.', cid)
					doSendMagicEffect(getCreaturePosition(cid), 13)
					doPlayerAddOutfit(cid, 133, 1) -- Male summoner
					setPlayerStorageValue(cid,belt,1)
					talkState = 0
				else
					npcHandler:say('You don\'t have a winning ticket!', cid)
				end
			elseif getPlayerSex(cid) == 0 then
				if	getPlayerItemCount(cid,5958) >= 1 then
					npcHandler:say('Congratulations, here is your fluid belt.', cid)
					doSendMagicEffect(getCreaturePosition(cid), 13)
					doPlayerRemoveItem(cid, 5958, 1)
					doPlayerAddOutfit(cid,138,1) -- Female mage
					setPlayerStorageValue(cid,belt,1)
					talkState = 0
				end
			end
		else
			npcHandler:say('You already have the fluid belt.', cid)
			talkState = 0
		end
		talkState = 0
	elseif not msgcontains(msg, 'yes') and talkState == 11 then
		npcHandler:say('Perhaps I can help you with something else then?', cid)
		talkState = 0
	elseif msgcontains(msg, 'cape') then
		npcHandler:say('Would you like to exchange 5 bat wings, 5 red pieces of cloth, 5 ape fur and 10 spider silks for the summoner cape addon?', cid)
		talkState = 21
	elseif msgcontains(msg, 'yes') and talkState == 21 then
		addon = getPlayerStorageValue(cid, cape)
		if addon == -1 then
			if getPlayerSex(cid) == 1 then
				if getPlayerItemCount(cid,5894) >= 5 and getPlayerItemCount(cid,5911) >= 5 and getPlayerItemCount(cid,5883) >= 5 and getPlayerItemCount(cid,5879) >= 10 then
					doPlayerRemoveItem(cid,5894,5)
					doPlayerRemoveItem(cid,5911,5)
					doPlayerRemoveItem(cid,5883,5)
					doPlayerRemoveItem(cid,5879,10)
					npcHandler:say('Congratulations, here is your cape.', cid)
					doSendMagicEffect(getCreaturePosition(cid), 13)
					doPlayerAddOutfit(cid, 133, 2) -- Male summoner
					setPlayerStorageValue(cid,cape,1)
					talkState = 0
				else
					npcHandler:say('You don\'t have all the items!', cid)
					talkState = 0
				end
			elseif getPlayerSex(cid) == 0 then
				npcHandler:say('I\'m sorry but I can only help males receive this addon!', cid)
				talkState = 0
			end
		else
			npcHandler:say('You already have the summoner cape addon.', cid)
			talkState = 0
		end
		talkState = 0
	elseif not msgcontains(msg, 'yes') and talkState == 11 then
		npcHandler:say('Perhaps I can help you with something else then?', cid)		

	end
end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Sellable
shopModule:addSellableItem({'flask'}, 		7636, 5,	'flask')
shopModule:addSellableItem({'flask'}, 		7634, 5,	'flask')
shopModule:addSellableItem({'flask'}, 		7635, 5,	'flask')
-- Buyable
shopModule:addBuyableItem({'hearth stone'}, 				12586, 10000,	'hearth stone')
shopModule:addBuyableItem({'light wand', 'lightwand'}, 		2163, 50,	'magic light wand')
shopModule:addBuyableItem({'spellbook'}, 					2175, 150,	'spellbook')
-- potions
shopModule:addBuyableItem({'ultimate health potion'}, 		8473, 175,	'ultimate health potion')
shopModule:addBuyableItem({'great spirit potion'}, 		8472, 110,	'great spirit potion')
shopModule:addBuyableItem({'great health potion'}, 			7591, 110,		'great health potion')
shopModule:addBuyableItem({'strong health potion'}, 		7588, 55,	'strong health potion')
shopModule:addBuyableItem({'health potion'}, 				7618, 20,	'health potion')
shopModule:addBuyableItem({'great mana potion'}, 			7590, 110,	'great mana potion')
shopModule:addBuyableItem({'strong mana potion'}, 			7589, 55,	'strong mana potion')
shopModule:addBuyableItem({'mana potion'}, 					7620, 20,	'mana potion')

-- Runes

shopModule:addBuyableItem({'animate dead'}, 				2316, 375,	'animate dead rune')
shopModule:addBuyableItem({'antidote'}, 					2266, 65,	'antidote rune')
shopModule:addBuyableItem({'avalanche'},		 			2274, 45,	'avalanche rune')
shopModule:addBuyableItem({'chameleon'}, 					2291, 210,	'chameleon rune')
shopModule:addBuyableItem({'convince creature'}, 			2290, 80,	'convince creature rune')
shopModule:addBuyableItem({'desintegrate'}, 				2310, 26,	'desintegrate rune')
shopModule:addBuyableItem({'destroy field'}, 				2261, 15,	'destroy field rune')
shopModule:addBuyableItem({'energy bomb'}, 					2262, 162,	'energy bomb rune')
shopModule:addBuyableItem({'energy field'}, 				2277, 38,	'energy field rune')
shopModule:addBuyableItem({'energy wall'}, 					2279, 85,	'energy wall rune')
shopModule:addBuyableItem({'explosion'}, 					2313, 31,   'explosion rune')
shopModule:addBuyableItem({'fire field'}, 					2301, 28,	'fire field rune')
shopModule:addBuyableItem({'fire bomb'}, 					2305, 117,	'fire bomb rune')
shopModule:addBuyableItem({'fire wall'}, 					2303, 61,	'fire wall rune')
shopModule:addBuyableItem({'great fireball'}, 				2304, 45,	'great fireball rune')
shopModule:addBuyableItem({'fireball'}, 					2302, 30,	'fireball rune')
shopModule:addBuyableItem({'heavy magic missile'}, 			2311, 12,	'heavy magic missile rune')
shopModule:addBuyableItem({'icicle'},		 				2271, 30,	'icicle rune')
shopModule:addBuyableItem({'intense healing'}, 				2265, 95,	'intense healing rune')
shopModule:addBuyableItem({'light magic missile'}, 			2287, 4,	'light magic missile rune')
shopModule:addBuyableItem({'magic wall'}, 					2293, 116,	'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 					2278, 700,	'paralyze rune')
shopModule:addBuyableItem({'poison bomb'}, 					2286, 85,	'poison bomb rune')
shopModule:addBuyableItem({'poison field'}, 				2285, 21,	'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 					2289, 52,	'poison wall rune')
shopModule:addBuyableItem({'soulfire'}, 					2308, 46,	'soulfire rune')
shopModule:addBuyableItem({'stalagmite'},		 			2292, 12,	'stalagmite rune')
shopModule:addBuyableItem({'stone shower'},		 			2288, 37,	'stone shower rune')
shopModule:addBuyableItem({'sudden death'}, 				2268, 108,	'sudden death rune')
shopModule:addBuyableItem({'thunderstorm'},		 			2315, 37,	'thunderstorm rune')
shopModule:addBuyableItem({'ultimate healing'}, 			2273, 175,	'ultimate healing rune')
shopModule:addBuyableItem({'blank'}, 						2260, 5,	'blank rune')
-- Rods
shopModule:addBuyableItem({'snakebite rod'}, 				2182, 500,	'snakebite rod')
shopModule:addBuyableItem({'moonlight rod'}, 				2186, 1000,	'moonlight rod')
shopModule:addBuyableItem({'volcanic rod'}, 				2185, 5000,	'volcanic rod')
shopModule:addBuyableItem({'terra rod'}, 					2181, 10000,	'terra rod')
shopModule:addBuyableItem({'hailstorm rod'}, 				2183, 15000,	'hailstorm rod')
shopModule:addBuyableItem({'necrotic rod'}, 				2185, 5000,	'necrotic rod')
shopModule:addBuyableItem({'northwind rod'}, 				8911, 7500,	'northwind rod')
shopModule:addBuyableItem({'springsprout rod'}, 			8912, 18000,	'springsprout rod')
shopModule:addBuyableItem({'underworld rod'}, 				8910, 22000,	'underworld rod')
-- Wands
shopModule:addBuyableItem({'wand of vortex'}, 				2190, 500,	'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath'}, 		2191, 1000,	'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague'}, 				2188, 5000,	'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy'}, 		2189, 10000,	'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno'}, 				2187, 15000,	'wand of inferno')
shopModule:addBuyableItem({'wand of draconia'}, 			8921, 7500,	'wand of draconia')
shopModule:addBuyableItem({'wand of starstorm'}, 			8920, 18000,	'wand of starstorm')
shopModule:addBuyableItem({'wand of voodoo'}, 				8922, 22000,	'wand of voodoo')
-- **********
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())