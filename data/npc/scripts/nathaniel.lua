local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid) 				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	handedIn = getPlayerStorageValue(cid,2310)
	handedInLog = getPlayerStorageValue(cid,2311)
	if msgcontains(msg, 'medicine') then
		npcHandler:say('Do you have a medicine pouch with you that I may have?', cid)
		if handedIn == -1 then
			setPlayerStorageValue(cid,2310,0)
		end
		talkstate = 2
	end
	if msgcontains(msg, 'yes') and talkstate == 2 then
		if doPlayerRemoveItem(cid, 13506, 1) then -- Take pouch
			doPlayerAddItem(cid, 13670, 1) -- Give Bag
			setPlayerStorageValue(cid,2310, handedIn + 1) -- Add 1 to handed in
			if getPlayerStorageValue(cid,2310) == 50 then -- has handed in 50 pouches
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid,158,1) -- f
				else
					doPlayerAddOutfit(cid,154,1) -- m
				end
				npcHandler:say('Nicely done. That\'s 50 medicine pouches you have handed in, take this shamans voodoo mask as a reward.', cid)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have earned the shaman voodoo mask addon.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			else
				npcHandler:say('Here, take these belongings of a deceased victim, perhaps you will find something good inside.', cid)
			end
		else
			npcHandler:say('You don\'t have any.', cid)
		end
		talkstate = 1
	elseif talkstate ==2 and msgcontains(msg, 'no') then
		npcHandler:say('Perhaps another time then.', cid)
		talkstate = 1
	end
	if msgcontains(msg,'stake') then
		npcHandler:say('If you bring me 10 pieces of wood from swamp trolls I\'m sure I can fashion you a wooden stake from one of them, just ask me about the {wood} when you have 10.', cid)
	end
	if msgcontains(msg,'wood') then
		npcHandler:say('Have you brought me 10 pieces of wood from swamp trolls?', cid)
		talkstate = 11
	end
	if msgcontains(msg,'yes') and talkstate == 11 then
		if doPlayerRemoveItem(cid, 5901, 10) then
			npcHandler:say('Good job... Yes, this one will do fine... Okay, here\'s the wooden stake.', cid)
			doPlayerAddItem(cid, 5941, 1)
			talkstate = 1
		else
			npcHandler:say('You don\'t have 10 pieces of wood from swamp trolls!', cid)
			talkstate = 1
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())