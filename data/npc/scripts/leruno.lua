local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid) 				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 			npcHandler:onThink() 				end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg,'outfit') then
		if getPlayerStorageValue(cid,2316) == -1 then
			npcHandler:say('Ah yes, the outfit of the mighty hunter. Are you interested in it?', cid)
			talkState = 1
		end
	elseif msgcontains(msg,'yes') and talkState == 1 then
		npcHandler:say('In that case maybe we can help each other. If you do a small favour for me I\'ll help you get the full hunter outfit. Sound like a deal?', cid)
		talkState = 2
	elseif not msgcontains(msg,'yes') and talkState == 1 then
		npcHandler:say('Perhaps another time then.', cid)
		talkState = 0
	elseif msgcontains(msg,'yes') and talkState == 2 then
		npcHandler:say('Right then, take this fleshy bone and use it on a wolf. There\'s a sedative in the meat which will allow you to capture the wolf. When you have done this, bring the captured {wolf} back to me.', cid)
		doPlayerAddItem(cid, 13830, 1)
		setPlayerStorageValue(cid,2316,1) -- player has been given bone
		talkState = 0
	elseif not msgcontains(msg,'yes') and talkState == 2 then
		npcHandler:say('Nevermind then.', cid)
		talkState = 0
	elseif msgcontains(msg,'wolf') and getPlayerItemCount(cid,13633) >=1 then
		doPlayerRemoveItem(cid,13633,1)
		doSendMagicEffect(getCreaturePosition(cid), 12)
		setPlayerStorageValue(cid,2316,2) -- received addons
		if getPlayerSex(cid) == 0 then
			npcHandler:say('Nicely done. Here are your winged tiara and sniper gloves. Wear them with pride.', cid)
			doPlayerAddOutfit(cid,137,3) -- f
		else
			npcHandler:say('Nicely done. Here are your hooded cloak and sniper gloves. Wear them with pride.', cid)
			doPlayerAddOutfit(cid,129,3) -- m
		end
	elseif msgcontains(msg,'wolf') and getPlayerItemCount(cid,13830) >=1 then
		npcHandler:say('How about you go capture one for me.', cid)
	-- Pirate Letetr Quest
	elseif msgcontains(msg,'letter') and (getPlayerStorageValue(cid,2341) == 1 or getPlayerStorageValue(cid,2341) == 2) then
		npcHandler:say('Oh my, this is terrible, and you say there was a lot of wreckage. Please go and see Class Trainer Simon and ask him if he knows about this {wreckage} you found.', cid)
		setPlayerStorageValue(cid,2341,2)
	elseif msgcontains(msg,'pirate') and getPlayerStorageValue(cid,2341) == 3 then
		npcHandler:say('No, no, my poor Abbey. Do you think that you might try and rescue her from the pirates for me{?}', cid)
		talkState = 11
	elseif msgcontains(msg,'yes') and talkState == 11 then
		npcHandler:say('Thank you. Near where you found the wreckage there should be a vortex. It is my belief that if you use that vortex it will take you to the pirates hideout. As I\'m pretty sure there will be no way back you had better take this Hearth Stone. If and when you find and rescue Abbey, simply use the Hearth Stone and it will return you to your home temple. If you find {Abbey} and rescue her, return to me for a {reward}. Now go, there\'s no time to waste!',cid)
		setPlayerStorageValue(cid,2341,4)
		doPlayerAddItem(cid,12586,1)
		talkState = 0
	elseif (msgcontains(msg,'abbey') or msgcontains(msg,'rescue') or msgcontains(msg,'reward')) and getPlayerStorageValue(cid,2341) == 5 then
		npcHandler:say('Thank you so much for your help. Abbey told me how heroic you were. As a reward you can keep the Hearth Stone. Also, here\'s 1,000 gold, and I\'m sure you gained experience. You can use that pirate vortex any time you like and you\'ll also be able to pass the cabin door from now on.', cid)
		setPlayerStorageValue(cid,2341,6)
		setPlayerStorageValue(cid,2340,1)
		doPlayerAddExp(cid,7500) -- give Exp
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 7500 experience.") -- Show Exp
		doPlayerAddItem(cid, 2152, 10) -- 10 platinum coins
		doSendMagicEffect(getCreaturePosition(cid), 12)
	elseif msgcontains(msg,'abbey') and getPlayerStorageValue(cid,2341) >= 6 then
		npcHandler:say('Thanks again.', cid)
	end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
