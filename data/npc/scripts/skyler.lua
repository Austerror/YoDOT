local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end
	
	if msgcontains(msg,'tiara') then
		if getPlayerSex(cid) == 0 then
			batWings = getPlayerItemCount(cid, 5894)
			bloodHerbs = getPlayerItemCount(cid, 2798)
			vampDusts = getPlayerItemCount(cid, 5905)
			if batWings == 0 or bloodHerbs == 0 or vampDusts == 0 then
				npcHandler:say('Bring me ten bat wings, ten blood herbs and 10 vampire dusts and I\'ll give you the mages tiara addon.',cid)
			else
				npcHandler:say('Would you like to exchange ten bat wings, ten blood herbs and 10 vampire dusts for the mage tiara addon?',cid)
				talkState = 2
			end
		else
			npcHandler:say('I can only help females with this addon.',cid)
		end
	end
	if msgcontains(msg,'yes') and talkState == 2 then
		if doPlayerRemoveItem(cid,5894,10) == true and doPlayerRemoveItem(cid,2798,10) == true and doPlayerRemoveItem(cid,5905,10) == true then
			npcHandler:say('Here you are ' .. getCreatureName(cid) .. '. Wear this tiara with honour. Congratulations!',cid)
			doPlayerAddOutfit(cid,138,2)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			talkState = 0
		else
			npcHandler:say('Where\'d those items go?!!??!',cid)
			talkState = 0
		end
	end
end	

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
--  Sellable
shopModule:addSellableItem({'emerald bangle'},				2127, 800,	'emerald bangle')
shopModule:addSellableItem({'white pearl'}, 				2143, 160,	'white pearl')
shopModule:addSellableItem({'black pearl'}, 				2144, 280,	'black pearl')
shopModule:addSellableItem({'giant green pearl'}, 			7632, 3000, 'giant green pearl')
shopModule:addSellableItem({'giant brown pearl'}, 			7633, 3000, 'giant brown pearl')
shopModule:addSellableItem({'golden mug'}, 					2033, 250,	'golden mug')
shopModule:addSellableItem({'small diamond'}, 				2145, 300,	'small diamond')
shopModule:addSellableItem({'small sapphire'}, 				2146, 250,	'small sapphire')
shopModule:addSellableItem({'small ruby'}, 					2147, 250,	'small ruby')
shopModule:addSellableItem({'small emerald'}, 				2149, 250,	'small emerald')
shopModule:addSellableItem({'small amethyst'}, 				2150, 200,	'small amethyst')
shopModule:addSellableItem({'small topaz'}, 				9970, 200,	'small topaz')
shopModule:addSellableItem({'wedding ring'}, 				2121, 100,	'wedding ring')
shopModule:addSellableItem({'violet gem'}, 					2153, 10000,'violet gem')
shopModule:addSellableItem({'yellow gem'}, 					2154, 1000, 'yellow gem')
shopModule:addSellableItem({'green gem'}, 					2155, 5000,	'green gem')
shopModule:addSellableItem({'red gem'}, 					2156, 1000,	'red gem')
shopModule:addSellableItem({'blue gem'}, 					2158, 5000,	'blue gem')
-- Buyable
shopModule:addBuyableItem({'white pearl'}, 					2143, 320, 	'white pearl')
shopModule:addBuyableItem({'black pearl'}, 					2144, 560, 	'black pearl')
shopModule:addBuyableItem({'small diamond'}, 				2145, 600, 	'small diamond')
shopModule:addBuyableItem({'small sapphire'}, 				2146, 500, 	'small sapphire')
shopModule:addBuyableItem({'small ruby'}, 					2147, 500, 	'small ruby')
shopModule:addBuyableItem({'small emerald'}, 				2149, 500, 	'small emerald')

shopModule:addBuyableItem({'small enchanted amethyst'},		7762, 750, 'small enchanted amethyst')
shopModule:addBuyableItem({'small enchanted emerald'}, 		7761, 750, 'small enchanted emerald')
shopModule:addBuyableItem({'small enchanted ruby'},			7760, 750, 'small enchanted ruby')
shopModule:addBuyableItem({'small enchanted sapphire'},		7759, 750, 'small enchanted sapphire')

shopModule:addBuyableItem({'wedding ring'}, 				2121, 990, 	'wedding ring')
shopModule:addBuyableItem({'golden amulet'}, 				2130, 6600, 'golden amulet')
shopModule:addBuyableItem({'ruby necklace'}, 				2133, 3560, 'ruby necklace')
-- Furniture
shopModule:addBuyableItem({'armor rack'},			6115, 90, 	'armor rack')
shopModule:addBuyableItem({'bamboo drawer'},		3936, 20, 	'bamboo drawer')
shopModule:addBuyableItem({'bamboo table'},			3919, 25, 	'bamboo table')
shopModule:addBuyableItem({'barrel'},				3932, 12, 	'barrel')
shopModule:addBuyableItem({'blue bed'},				7904, 80, 	'blue bed')
shopModule:addBuyableItem({'green bed'},			7905, 80, 	'green bed')
shopModule:addBuyableItem({'red bed'},				7906, 80, 	'red bed')
shopModule:addBuyableItem({'yellow bed'},			7907, 80, 	'yellow bed')
shopModule:addBuyableItem({'big table'},			3909, 30, 	'big table')
shopModule:addBuyableItem({'birdcage'},				3922, 50, 	'birdcage')
shopModule:addBuyableItem({'bookcase'},				6373, 70, 	'bookcase')
shopModule:addBuyableItem({'carved stone table'},	3913, 30, 	'carved stone table')
shopModule:addBuyableItem({'chimney'},				8692, 200, 	'chimney')
--shopModule:addBuyableItem({'christmas tree'},		3933, 50, 	'christmas tree')
shopModule:addBuyableItem({'coal basin'},			3912, 25, 	'coal basin')
shopModule:addBuyableItem({'crystal pedestal'},		9976, 100, 	'crystal pedestal')
shopModule:addBuyableItem({'crystal table'},		9974, 15, 	'crystal table')
shopModule:addBuyableItem({'dragon statue'},		11133, 100, 'dragon statue')
shopModule:addBuyableItem({'dragon statue'},		11205, 100, 'dragon statue')
shopModule:addBuyableItem({'drawer'},				3915, 18, 	'drawer')
shopModule:addBuyableItem({'dresser'},				3916, 25, 	'dresser')
shopModule:addBuyableItem({'globe'},				3923, 50, 	'globe')
shopModule:addBuyableItem({'goblin statue'},		3930, 50, 	'goblin statue')
shopModule:addBuyableItem({'green cushioned chair'},3904, 40, 	'green cushioned chair')
shopModule:addBuyableItem({'harp'},					3921, 50, 	'harp')
shopModule:addBuyableItem({'indoor plant'},			3931, 8, 	'indoor plant')
shopModule:addBuyableItem({'ivory chair'},			3906, 25, 	'ivory chair')
shopModule:addBuyableItem({'knight statue'},		3927, 50, 	'knight statue')
shopModule:addBuyableItem({'large amphora'},		3929, 50, 	'large amphora')
shopModule:addBuyableItem({'lizard weapon rack'},	11126, 100, 'lizard weapon rack')
shopModule:addBuyableItem({'locker'},				3918, 30, 	'locker')
shopModule:addBuyableItem({'minotaur statue'},		3928, 50, 	'minotaur statue')
shopModule:addBuyableItem({'oven'},					6372, 80, 	'oven')
shopModule:addBuyableItem({'pendulum clock'},		3917, 75, 	'pendulum clock')
shopModule:addBuyableItem({'piano'},				3926, 200, 	'piano')
shopModule:addBuyableItem({'red cushioned chair'},	3903, 100, 	'red cushioned chair')
shopModule:addBuyableItem({'rocking chair'},		3925, 25, 	'rocking chair')
shopModule:addBuyableItem({'rocking horse'},		3934, 30, 	'rocking horse')
shopModule:addBuyableItem({'round table'},			3911, 25, 	'round table')
shopModule:addBuyableItem({'small table'},			3908, 20, 	'small table')
shopModule:addBuyableItem({'trunk chair'},			3907, 20, 	'trunk chair')
shopModule:addBuyableItem({'snowman'},				11124, 100, 'snowman')
shopModule:addBuyableItem({'sofa chair'},			3902, 30, 	'sofa chair')
shopModule:addBuyableItem({'square table'},			3910, 30, 	'square table')
shopModule:addBuyableItem({'table lamp'},			3924, 35, 	'table lamp')
shopModule:addBuyableItem({'telescope'},			3935, 70, 	'telescope')
shopModule:addBuyableItem({'trunk table'},			3920, 20, 	'trunk table')
shopModule:addBuyableItem({'trough'},				3937, 7, 	'trough')
shopModule:addBuyableItem({'trunk'},				7503, 10, 	'trunk')
shopModule:addBuyableItem({'tusk chair'},			3905, 25, 	'tusk chair')
shopModule:addBuyableItem({'tusk table'},			3914, 25, 	'tusk table')
shopModule:addBuyableItem({'weapon rack'},			6114, 90, 	'weapon rack')
shopModule:addBuyableItem({'wooden chair'},			3901, 15, 	'wooden chair')
-- **********
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())