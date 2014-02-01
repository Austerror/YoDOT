local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	maskAddon = 2615
	shoulderAddon = 2616
	
	if msgcontains(msg,'mask') or msgcontains(msg,'tiara') then
		if getPlayerStorageValue(cid,2615) == 1 then
			npcHandler:say('It suits you well.',cid)
		else
			if getPlayerSex(cid) == 1 then
				npcHandler:say('If you give me a medusa shield, a dragon scale mail, crown legs and a ring of the sky I\'ll provide you the wizard skull mask addon. Sound like a deal?',cid)
			else
				npcHandler:say('If you give me a medusa shield, a dragon scale mail, crown legs and a ring of the sky I\'ll provide you the wizard snake tiara addon. Sound like a deal?',cid)
			end
			talkState = 1
		end
	elseif msgcontains(msg,'yes') and talkState == 1 then
		medusaShield = getPlayerItemCount(cid, 2536)
		dragonScaleMail = getPlayerItemCount(cid, 2492)
		crownLegs = getPlayerItemCount(cid, 2488)
		ringOfTheSky = getPlayerItemCount(cid, 2123)
		talkState = 0
		if medusaShield >= 1 and dragonScaleMail >= 1 and crownLegs >=1 and ringOfTheSky >=1 then
			doPlayerRemoveItem(cid, 2536, 1)
			doPlayerRemoveItem(cid, 2492, 1)
			doPlayerRemoveItem(cid, 2488, 1)
			doPlayerRemoveItem(cid, 2123, 1)
			setPlayerStorageValue(cid,2615,1)
			if getPlayerSex(cid) == 0 then
				npcHandler:say('There you go, the wizard snake tiara addon.',cid)
				doPlayerAddOutfit(cid,149,2)
				doSendMagicEffect(getCreaturePosition(cid), 12)
			else
				npcHandler:say('There you go, the wizard skull mask addon.',cid)
				doPlayerAddOutfit(cid,145,2)
				doSendMagicEffect(getCreaturePosition(cid), 12)
			end
		else
			npcHandler:say('You don\'t have all the items.',cid)
		end
	elseif msgcontains(msg,'shoulder') or msgcontains(msg,'wing') then
		if getPlayerStorageValue(cid,2615) == 1 then
			if getPlayerStorageValue(cid,2616) == 1 then
				npcHandler:say('It suits you well.',cid)
			else
				if getPlayerSex(cid) == 1 then
					npcHandler:say('If you bring me 25 blood herbs I\'ll give you the wizard skull shoulder pads addon. Sound like a deal?',cid)
					talkState = 2
				else
					npcHandler:say('If you bring me 25 blood herbs I\'ll give you the wizard wings addon. Sound like a deal?',cid)
					talkState = 2
				end
			end
		else
			if getPlayerSex(cid) == 1 then
				npcHandler:say('You need to earn the wizard skull mask addon before I\'ll help you get the wizard skull shoulder pads.',cid)
				talkState = 0
			else
				npcHandler:say('You need to earn the wizard snake tiara addon before I\'ll help you get the wizard wings.',cid)
				talkState = 0
			end
		end
	elseif msgcontains(msg,'yes') and talkState == 2 then
		bloodHerbs = getPlayerItemCount(cid, 2798)
		if bloodHerbs >= 25 then
			doPlayerRemoveItem(cid, 2798, 25)
			setPlayerStorageValue(cid,2616,1)
			if getPlayerSex(cid) == 0 then
				npcHandler:say('There you go, the wizard wings addon.',cid)
				doPlayerAddOutfit(cid,149,1)
				doSendMagicEffect(getCreaturePosition(cid), 12)
				talkState = 0
			else
				npcHandler:say('There you go, the wizard skull should pads addon.',cid)
				doPlayerAddOutfit(cid,145,1)
				doSendMagicEffect(getCreaturePosition(cid), 12)
				talkState = 0
			end
		else
			npcHandler:say('You don\'t have all the items, you only have ' .. bloodHerbs ..'.',cid)
			talkState = 0
		end
	--elseif msgcontains(msg,'tool') or msgcontains(msg,'allrounder') then
		--if getPlayerStorageValue(cid,2617) == -1 then
			--npcHandler:say('Would you be interested in an allround tool that acts as a shovel, rope, pick, blessed wooden stake and an obsidian knife?',cid)
			--talkState = 3
		--elseif getPlayerStorage
		-- more to go in here
		--end
	elseif msgcontains(msg,'yes') and talkState == 3 then
		npcHandler:say('Okay then, take this allrounder. It needs some work before you can use it. First thing you need to do is use a light shovel on the tool, this will teach it how to be a shovel. Ask me about your {tool} once you have done that.',cid)
		allrounder = doPlayerAddItem(cid,10515,1)
		--doSetItemActionId(allrounder.uid, actionid)
		setPlayerStorageValue(cid,2617,1)
	end
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
-- Buyable
shopModule:addBuyableItem({'fishing rod'},		 		2580, 150, 	'fishing rod')
shopModule:addBuyableItem({'shovel'}, 					2554, 50, 	'shovel')
shopModule:addBuyableItem({'pick'}, 					2553, 50, 	'pick')
shopModule:addBuyableItem({'scythe'}, 					2550, 50, 	'scythe')
shopModule:addBuyableItem({'bag'}, 						1987, 5, 	'bag')
shopModule:addBuyableItem({'rope'}, 					2120, 50, 	'rope')
shopModule:addBuyableItem({'backpack'}, 				1988, 20, 	'backpack')
shopModule:addBuyableItem({'watch'}, 					6091, 20, 	'watch')
shopModule:addBuyableItem({'torch'}, 					2050, 2, 	'torch')
shopModule:addBuyableItem({'machete'}, 					2420, 40, 	'machete')
shopModule:addBuyableItem({'plate'}, 					2035, 6, 	'plate')
shopModule:addBuyableItem({'bucket'}, 					7142, 4, 	'bucket')
shopModule:addBuyableItem({'bottle'}, 					2007, 3, 	'bottle')
shopModule:addBuyableItem({'mug'}, 						2012, 4, 	'mug')
shopModule:addBuyableItem({'cup'}, 						2013, 2, 	'cup')
shopModule:addBuyableItem({'jug'}, 						2014, 10, 	'jug')
shopModule:addBuyableItem({'scroll'}, 					1949, 5, 	'scroll')
shopModule:addBuyableItem({'document'}, 				1952, 12, 	'document')
shopModule:addBuyableItem({'parchment'}, 				1948, 8, 	'parchment')
shopModule:addBuyableItem({'brown book'}, 				1950, 15, 	'brown book')
shopModule:addBuyableItem({'black book'}, 				1955, 15, 	'black book')
shopModule:addBuyableItem({'small book'}, 				1958, 15, 	'small book')
shopModule:addBuyableItem({'present box'}, 				2331, 10, 	'present box')
shopModule:addBuyableItem({'sniper arrow'}, 			7364, 5,	'sniper arrow')
shopModule:addBuyableItem({'onyx arrow'}, 				7365, 7,	'onyx arrow')
shopModule:addBuyableItem({'arrow'}, 					2544, 3,	'arrow')
shopModule:addBuyableItem({'piercing bolt'}, 			7363, 5,	'piercing bolt')
shopModule:addBuyableItem({'power bolt'}, 				2547, 7,	'power bolt')
shopModule:addBuyableItem({'bolt'}, 					2543, 4,	'bolt')
shopModule:addBuyableItem({'royal spear'}, 				7378, 15, 	'royal spear')
shopModule:addBuyableItem({'spear'}, 					2389, 9, 	'spear')
shopModule:addBuyableItem({'crossbow'}, 				2455, 500, 	'crossbow')
shopModule:addBuyableItem({'valentines card'}, 			6538, 30, 	'valentines card')
shopModule:addBuyableItem({'vortex bolt'}, 				15649, 6, 	'vortex bolt')
shopModule:addBuyableItem({'tarsal arrow'}, 			15648, 6, 	'tarsal arrow')
shopModule:addBuyableItem({'drill bolt'}, 				18436, 12, 	'drill bolt')
shopModule:addBuyableItem({'prismatic bolt'}, 			18435, 20, 	'prismatic bolt')
shopModule:addBuyableItem({'shiver arrow'}, 			7839, 5, 	'shiver arrow')
shopModule:addBuyableItem({'flash arrow'}, 				7838, 5, 	'flash arrow')
shopModule:addBuyableItem({'flaming arrow'}, 			7840, 5, 	'flaming arrow')
shopModule:addBuyableItem({'envenomed arrow'}, 			18437, 12, 	'envenomed arrow')
shopModule:addBuyableItem({'earth arrow'}, 				7850, 5, 	'earth arrow')
shopModule:addBuyableItem({'crstalline arrow'}, 		18304, 20, 	'crystalline arrow')
shopModule:addBuyableItem({'watering can'}, 			7734, 50, 	'watering can')
shopModule:addBuyableItem({'flower pot'}, 				7655, 150, 	'flower pot')

-- Sellable
shopModule:addSellableItem({'light shovel'}, 			5710, 300, 	'light shovel')
-- **********
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())