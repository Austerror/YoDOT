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

	local newhavenstep = getPlayerStorageValue(cid, 2010)

	if (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 7 then
		npcHandler:say('So Jesse told you I was looking for you, that\'s good. I may have a task for you but first we need to get you a {mount}.', cid)
	elseif msgcontains(msg, 'mount') and newhavenstep == 7 then
		npcHandler:say('Would you be interested in getting a black sheep as a mount?', cid)
		setPlayerStorageValue(cid,2010,8)
	elseif msgcontains(msg, 'yes') and newhavenstep == 8 then
		npcHandler:say('Excellent choice. Take these reins and use them on a black sheep, the white ones are simply too weak to ride. Once you have tamed one, ask me about a {mission}.', cid)
		doPlayerAddItem(cid, 13295, 1)
		setPlayerStorageValue(cid,2010,9)
	elseif not msgcontains(msg, 'yes') and newhavenstep == 8 then
		npcHandler:say('Another time then.', cid)
		setPlayerStorageValue(cid,2010,7)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 9 then
		if not getPlayerMount(cid, 4) then
			npcHandler:say('You haven\'t tamed a black sheep yet, get back to it.', cid)
		else
			npcHandler:say('If you haven\'t worked it out already, to mount and dismount, simply press Ctrl R. Now, ask me about that {task} I have for you when you are ready.', cid)
			doPlayerAddExp(cid,250) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 250 experience.") -- Show Exp
			setPlayerStorageValue(cid,2010,10)
		end
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 10 then
		npcHandler:say('Oh of course of course. Firstly, have you noticed your mana under your health? Mana is used for magic spells. Here in New Haven we only use one {spell}.', cid)
		setPlayerStorageValue(cid,2010,11)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 11 then
		npcHandler:say('I was trying to tell you about the only {spell} we use in New Haven.', cid)
	elseif msgcontains(msg, 'spell') and newhavenstep == 11 then
		npcHandler:say('Yes, a light spell. Simply utter the words {utevo lux} and you will use up your mana to cast a magical light field around you. Go on, try it for yourself if you haven\'t already then remind me about the {task}.', cid)
		setPlayerStorageValue(cid,2010,12)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 12 then
		npcHandler:say('Oh of course of course. Where I\'m sending you that light spell will come in handy. Behind Toms Meats is a loose stone pile that leads to a troll cave. Head down there and kill 10 trolls for me would you?', cid)
		setPlayerStorageValue(cid,2010,13)
	elseif msgcontains(msg, 'yes') or msgcontains(msg, 'ok') and newhavenstep == 13 then
		npcHandler:say('Thank you. When you have finished, return to me and ask me about this {task}.', cid)
		setPlayerStorageValue(cid,2010,14)
		setPlayerStorageValue(cid, 2013, 0)
	elseif newhavenstep == 13 then
		npcHandler:say('Ask me about a {task} if you change your mind.', cid)
		setPlayerStorageValue(cid,2010,12)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 14 then
		if getPlayerStorageValue(cid, 2013) <=9 then
			npcHandler:say('You haven\'t killed 10 trolls yet. Come back when you have completed this {mission}.', cid)
		else
			npcHandler:say('Great work. Here\'s some experience and gold for your effort. Now go back and see Jesse, he has a final {task} for you before you\'re finished in New Haven.', cid)
			doPlayerAddExp(cid,500) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 500 experience.") -- Show Exp
			doPlayerAddItem(cid, 2152, 2)
			setPlayerStorageValue(cid,2010,15)
		end
	end
	return true
	
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
