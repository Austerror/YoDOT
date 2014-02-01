local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local teleTo = {x=1065, y=1070, z=7}
local talkState = 1

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end

	if msgcontains(msg, 'yes') and talkState == 1 then
		npcHandler:say('WHERE DO YOU WANT TO LIVE. {THANE} or {WHITE-PLUME ISLE}?', cid)
		talkState = 2
	elseif talkState == 2 then
		if msgcontains(msg, 'thane') then
			town = 3
			talkState = 3
			npcHandler:say('ARE YOU SURE, THIS DECISION IS IRREVERSABLE?', cid)
		elseif msgcontains(msg, 'white-plume isle') then
			town = 5
			talkState = 3
			npcHandler:say('ARE YOU SURE, THIS DECISION IS IRREVERSABLE?', cid)
		else
			npcHandler:say('ANOTHER TIME.', cid)
			talkState = 1
		end	
	
	elseif msgcontains(msg, 'yes') and talkState == 3 then
		npcHandler:say('WHAT VOCATION ARE YOU GOING TO BE. {KNIGHT}, {PALADIN}, {DRUID} OR {SORCERER}?', cid)
		talkState = 4
	elseif talkState == 4 then
		if msgcontains(msg, 'sorcerer') then
			vocation = 1
			talkState = 5
			npcHandler:say('ARE YOU SURE, THIS DECISION IS IRREVERSABLE?', cid)
		elseif msgcontains(msg, 'druid') then
			vocation = 2
			talkState = 5
			npcHandler:say('ARE YOU SURE, THIS DECISION IS IRREVERSABLE?', cid)
		elseif msgcontains(msg, 'paladin') then
			vocation = 3
			talkState = 5
			npcHandler:say('ARE YOU SURE, THIS DECISION IS IRREVERSABLE?', cid)
		elseif msgcontains(msg, 'knight') then
			vocation = 4
			talkState = 5
			npcHandler:say('ARE YOU SURE, THIS DECISION IS IRREVERSABLE?', cid)
		else
			npcHandler:say('ANOTHER TIME.', cid)
			talkState = 1
		end
	
	elseif talkState == 5 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('DON\'T FORGET TO GET YOUR VOCATIONAL EQUIPMENT FROM UNDER THE TEMPLE IN THANE!', cid)
			doPlayerSetTown(cid, town)
			doPlayerSetVocation(cid, vocation)
			doTeleportThing(cid, getPlayerMasterPos(cid))
			doSendMagicEffect(getPlayerMasterPos(cid), 10)
			talkState = 1
		else
			npcHandler:say('ANOTHER TIME.', cid)
			talkState = 1
		end
			
	end
	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())