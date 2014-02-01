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

	if msgcontains(msg,"unicycle") then
		npcHandler:say('Isn\'t it the coolest? It\'d wanna be, it wasn\'t very easy to {get}.', cid)
		talkState = 1
	elseif msgcontains(msg,"get") and talkState == 1 then
		npcHandler:say('Oh yeah, why, with the {demon hunting}, lava fountain, golems... Still worth it though.', cid)
		talkState = 2
	elseif msgcontains(msg,"demon hunting") and talkState == 2 then
		npcHandler:say('Why, for the orb of course... I\'ve said too much already. Just remember this one last thing... the makers of \'The Workshop\' believed gold conducted electricity best.', cid)
	end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
