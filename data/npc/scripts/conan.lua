local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return FALSE
	end
	if msgcontains(msg,'addon') then
		npcHandler:say('I can help you obtain the barbarian {wig} and {axe} addons.',cid)
	end
	if msgcontains(msg,'wig') then
		fightingSpirit = getPlayerItemCount(cid, 8182)
		warriorsSweat = getPlayerItemCount(cid, 5885)
		spiderSilk = getPlayerItemCount(cid, 5879)
		if fightingSpirit == 0 or warriorsSweat == 0 or spiderSilk == 0 then
			npcHandler:say('Bring me one fighting spirit, one warrior\'s sweat and ten spider silks and I\'ll give you a barbarian wig so you can look the part.',cid)
		else
			npcHandler:say('Do you want to give me one fighting spirit, one warrior\'s sweat and ten spider silks for the barbarian wig?',cid)
			talkState = 1
		end
	end
	if msgcontains(msg,'yes') and talkState == 1 then
		if doPlayerRemoveItem(cid,8182,1) == true and doPlayerRemoveItem(cid,5885,1) == true and doPlayerRemoveItem(cid,5879,10) == true then
			npcHandler:say('Here you are ' .. getCreatureName(cid) .. '. Wear this wig with honour. Congratulations!',cid)
			if getPlayerSex(cid) == 0 then
				doPlayerAddOutfit(cid,147,2)
			else
				doPlayerAddOutfit(cid,143,2)
			end
			doSendMagicEffect(getCreaturePosition(cid), 12)
			talkState = 0
		else
			npcHandler:say('Where\'d those items go?!!?!??',cid)
			talkState = 0
		end
	end
	--if not msgcontains(msg,'yes') and talkState >= 1 then
		--npcHandler:say('Fair enough.',cid)
		--talkState = 0
	--end
	if msgcontains(msg,'axe') then
		ironOre = getPlayerItemCount(cid, 5880)
		beheFang = getPlayerItemCount(cid, 5893)
		if ironOre == 0 or beheFang == 0 then
			npcHandler:say('Bring me one hundred iron ore and 5 perfect behemoth fangs and I\'ll craft you a fine barbarian axe you can wear.',cid)
		else
			npcHandler:say('Do you want to give me one hundred iron ore and 5 perfect behemoth fangs for the barbarian axe?',cid)
			talkState = 2
		end
	end
	if msgcontains(msg,'yes') and talkState == 2 then
		if doPlayerRemoveItem(cid,5880,100) == true and doPlayerRemoveItem(cid,5893,5) == true then
			npcHandler:say('Here you are ' .. getCreatureName(cid) .. '. Wear this axe with honour. Congratulations!',cid)
			if getPlayerSex(cid) == 0 then
				doPlayerAddOutfit(cid,147,1)
			else
				doPlayerAddOutfit(cid,143,1)
			end
			doSendMagicEffect(getCreaturePosition(cid), 12)
			talkState = 0
		else
			npcHandler:say('Where\'d those items go?!!?!??',cid)
			talkState = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
