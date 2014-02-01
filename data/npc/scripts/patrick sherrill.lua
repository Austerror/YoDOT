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
	if msgcontains(msg,'cake') then 
		if getPlayerStorageValue(cid, 2440) == 2 then
			if getPlayerStorageValue(cid, 2485) == -1 and doPlayerRemoveItem(cid, 6278, 1) then
				npcHandler:say('Hrumph... As if a cake will make this job any better. You\'re lucky I didn\'t kill you! Tell Joliver not to bother next time.',cid)
				setPlayerStorageValue(cid,2485,1) -- Set deliveredcake psv to 1 (delivered).
				setPlayerStorageValue(cid,2444,2) -- Set dailstatus to complete (1).
				doCreatureAddHealth(cid, -(getCreatureHealth(cid) - 25)) -- Remove all but 25 hit points.
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_DRAWBLOOD)
				doDecayItem(doCreateItem(2016,2, getCreaturePosition(cid)))
				-- The Cake is a Lie ACH
				tcialACH = getPlayerStorageValue(cid, 30029)
				if tcialACH < 25 then
					setPlayerStorageValue(cid, 30029, tcialACH+1)
				elseif tcialACH == 25 then
					doPlayerAddAchievement(cid, 279, true)
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
					setPlayerStorageValue(cid, 30029, tcialACH+1)
				end
				--
			else
				npcHandler:say('A cake? I don\'t know what you\'re talking about. Now stop wasting my time and let me get back to this pathetic job.',cid)
			end
		else
			npcHandler:say('A cake? I don\'t know what you\'re talking about. Now stop wasting my time and let me get back to this pathetic job.',cid)
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