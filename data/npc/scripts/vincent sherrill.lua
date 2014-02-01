local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end
	if msgcontains(msg,'quest') then 
		npcHandler:say('Unfortunately there are no quests here at all yet, not even all that much to hunt. That\'s all to change for sure.',cid)
	elseif msgcontains(msg,'antenna') or msgcontains(msg,'slithid') then
		totalAntenna = getPlayerItemCount(cid, 8710)
		if totalAntenna >= 25 then
			npcHandler:say('Would you like me to give you the slithid outfit in exchange for 25 slithid antennae?',cid)
			talkStep = 1
		else
			npcHandler:say('If you bring me 25 slithid antennae I\'ll give you the slithid outift.',cid)
			talkStep = 0
		end	
	elseif msgcontains(msg,'yes') and talkStep == 1 then
	-- remove antennae
		if doPlayerRemoveItem(cid, 8710, 25) then
			npcHandler:say('There you go.',cid)
			-- give outfit
			doPlayerAddOutfit(cid,465,0)
			doPlayerAddOutfit(cid,466,0)
			-- send effect
			doSendMagicEffect(getCreaturePosition(cid), 12)
			talkStep = 0
		else
			npcHandler:say('You seem to have misplaced the antennae.',cid)
			talkStep = 0
		end
	end
end
	
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'parcel'}, 	2595, 15,	'parcel')
shopModule:addBuyableItem({'parcel'}, 	2599, 1,	'label')
shopModule:addBuyableItem({'letter'}, 	2597, 10,	'letter')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())