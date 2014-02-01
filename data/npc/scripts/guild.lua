local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid) 				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function
	onThink()
		--selfTurn(SOUTH)
	npcHandler:onThink()
end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local foundLevel = 10
	local playerLevel = getPlayerLevel(cid)
	
	if msgcontains(msg,"found") then -- Wants to start a guild
		if foundLevel <= playerLevel then -- Has high enough level to create guild
			if getPlayerGuildName(cid) == "" then -- Is not in a guild
				npcHandler:say('What would you like to name your guild?', cid)
				talkState = 1
			else
				npcHandler:say('You are already in a guild, you will need to leave it before founding a new one.', cid)
				talkState = 0
			end
		else
			npcHandler:say('You are not high enough level to found a guild.', cid)
			talkState = 0
		end
	elseif talkState == 1 then -- Player is saying the name of the new guild
		gName = msg
		if getGuildId(gName) ~= false then -- Guild Name already exists
			npcHandler:say('There is already a guild with this name, please choose another.', cid)
			talkState = 1
		else
			npcHandler:say('Are you sure you want to call your guild ' .. gName .. '?', cid)
			talkState = 2
		end
	elseif msgcontains(msg,"yes") and talkState == 2 then -- Player has confirmed they want that name
		createGuild(gName)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())