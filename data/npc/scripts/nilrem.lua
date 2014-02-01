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
	yDaily = 2603 -- GSV & PSV for Daily Day#
	yieloTask = 2604 -- PSV for player on task (1), finished (2), or not (-1)
	yieloCount = 2605 -- PSV for Yielo's killed

	if math.abs(os.date("%j")) == getGlobalStorageValue(yDaily) then -- last daily was set today.
		--	Nothing to do here
	else
		setGlobalStorageValue(yDaily,os.date("%j")) -- set day of year for daily.

	end	
	
	if msgcontains(msg,"yielothax") or msgcontains(msg,"daily") then
		if getPlayerStorageValue(cid,yieloTask) == -1 then
			if getPlayerStorageValue(cid,yDaily) ~= getGlobalStorageValue(yDaily) then
				npcHandler:say('Kill for me five yielothax and I\'ll provide a novelty spellwand for you.',cid)
				setPlayerStorageValue(cid,yDaily,os.date("%j"))
				setPlayerStorageValue(cid,yieloTask,1)
				setPlayerStorageValue(cid,yieloCount,0)
			else
				npcHandler:say('You can\'t do this quest again today. Come back tomorrow and ask me again.',cid)
			end
		elseif getPlayerStorageValue(cid,yieloTask) == 1 then
			npcHandler:say('You haven\'t killed five yielothax yet.',cid)
		elseif getPlayerStorageValue(cid,yieloTask) == 2 then
			npcHandler:say('Well done, take this spellwand as a reward.',cid)
			doPlayerGiveItem(cid, 7735,1)
			setPlayerStorageValue(cid,yieloTask,-1)
		end
	end
	if msgcontains(msg,"wand") then
		snakeBite = getPlayerItemCount(cid, 2182)
		moonLight = getPlayerItemCount(cid, 2186)
		necroTic = getPlayerItemCount(cid, 2185)
		terRa = getPlayerItemCount(cid, 2181)
		hailStorm = getPlayerItemCount(cid, 2183)
		vorTex = getPlayerItemCount(cid, 2190)
		dragonBreath = getPlayerItemCount(cid, 2191)
		deCay = getPlayerItemCount(cid, 2188)
		cosmicEnergy = getPlayerItemCount(cid, 2189)
		inferNo = getPlayerItemCount(cid, 2187)
		anKh = getPlayerItemCount(cid, 2193)
		if getPlayerSex(cid) == 1 then
			if snakeBite == 0 or moonLight == 0 or necroTic == 0 or terRa == 0 or hailStorm == 0 or vorTex == 0 or dragonBreath == 0 or deCay == 0 or cosmicEnergy == 0 or inferNo == 0 or anKh == 0 then
				npcHandler:say('Bring me the 5 original rods, 5 original wands and an ankh then I\'ll make you your wand addon. If that\'s too much you could consider my {yielothax} daily for a novelty spellwand.',cid)
			else
				npcHandler:say('There you go, the mage wand addon.',cid)
				doPlayerAddOutfit(cid,130,1)
				doSendMagicEffect(getCreaturePosition(cid), 12)
				doPlayerRemoveItem(cid, 2182, 1)
				doPlayerRemoveItem(cid, 2186, 1)
				doPlayerRemoveItem(cid, 2185, 1)
				doPlayerRemoveItem(cid, 2181, 1)
				doPlayerRemoveItem(cid, 2183, 1)
				doPlayerRemoveItem(cid, 2190, 1)
				doPlayerRemoveItem(cid, 2191, 1)
				doPlayerRemoveItem(cid, 2188, 1)
				doPlayerRemoveItem(cid, 2189, 1)
				doPlayerRemoveItem(cid, 2187, 1)
				doPlayerRemoveItem(cid, 2193, 1)
			end
		else
			npcHandler:say('I can only give the wand addon to males sorry.',cid)
		end
	end
	if msgcontains(msg,"hat") then
		if getPlayerSex(cid) == 1 then
			ferumHat = getPlayerItemCount(cid, 5903)
			if ferumHat == 0 then
				npcHandler:say('If you bring me Ferumbras\' hat I\'ll grant you the right to wear it as an addon.',cid)
			else
				npcHandler:say('Oh my stars. The mighty Ferumbras\' hat. If you give it to me I\'ll grant you the right to wear it as an addon. What do you say?',cid)
				talkState = 2
			end
		else
			npcHandler:say('I\'m afraid to inform you that I can only help men gain this addon.',cid)
		end
	end
	if msgcontains(msg,"yes") and talkState == 2 then
		if doPlayerRemoveItem(cid,5903,1) == true then
			npcHandler:say('I am honoured to be in your presence ' .. getCreatureName(cid) .. '. I grant you the right to wear Ferumbras\' hat. Congratulations!',cid)
			doPlayerAddOutfit(cid,130,2)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			talkState = 0
		else
			npcHandler:say('Where\'d that hat go!!??!.',cid)
			talkState = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
