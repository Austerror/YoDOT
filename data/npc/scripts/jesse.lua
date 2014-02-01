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

	if (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == -1 then
		npcHandler:say('I\'m in the business of getting players ready for real adventuring. See, once you have reached level 8 you can depart for the mainland, in fact if you don\'t leave at level 8 you will always be weaker than normal. Are you interested in reaching level 8? (Answer {yes} or {no})', cid)
		setPlayerStorageValue(cid, 2010, 1)
		return true
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 1 then
		npcHandler:say('I\'m in the business of getting players ready for real adventuring. See, once you have reached level 8 you can depart for the mainland, in fact if you don\'t leave at level 8 you will always be weaker than normal. Are you interested in reaching level 8? (Answer {yes} or {no})', cid)
	elseif msgcontains(msg, 'yes') and newhavenstep == 1 then
		npcHandler:say('Ahh, good to hear. How about you start with killing 10 rats, {ok}? If you really couldn\'t be bothered with New Haven, ask me how to {bypass} it.', cid)
		setPlayerStorageValue(cid, 2010, 2)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 2 then
		npcHandler:say('How about you start with killing 10 rats, {ok}? You can find them under the village, simply \'use\' a grate to enter the sewers. Also be sure to loot the rats, some will carry gold and food. Food can be eaten to restore health and mana.', cid)
	elseif msgcontains(msg, 'ok') and newhavenstep == 2 then
		npcHandler:say('Splendid. Come back when you have killed 10 rats and ask me about your {mission}.', cid)
		setPlayerStorageValue(cid, 2010, 3)
		setPlayerStorageValue(cid, 2012, 0)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task') or msgcontains(msg, 'rats')) and newhavenstep == 3 then
		if getPlayerStorageValue(cid, 2012) <=9 then
			npcHandler:say('You haven\'t killed 10 {rats} yet. Come back when you have completed this {mission}.', cid)
		else
			npcHandler:say('Well done, here\'s some experience and gold for your efforts. Use that pile of 100 gold coins I just gave you and notice how it turns into a platinum coin. Changing stacks of 100 coins into higher denominations will save you space and capacity. Ask me for you next {mission} when you are ready.', cid)
			doPlayerAddExp(cid,50) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 50 experience.") -- Show Exp
			doPlayerAddItem(cid, 2148, 100)
			setPlayerStorageValue(cid, 2010, 4)
		end
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 4 then
		npcHandler:say('A bit trickier this time. I\'d like you to head south through the village and kill 5 wolves on the southern headland. Are you {ok} to do this?', cid)
		setPlayerStorageValue(cid, 2010, 5)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 5 then
		npcHandler:say('A bit trickier this time. I\'d like you to head south through the village and kill 5 wolves on the southern headland. Are you {ok} to do this?', cid)
	elseif msgcontains(msg, 'ok') and newhavenstep == 5 then
		npcHandler:say('Excellent! Return to me when you have killed 5 wolves and ask me about your {mission}. Try and use the environment to your advantage. There are places on the headland where only 2 wolves will be able to attack you at once. This will reduce the amount of damage you receive.', cid)
		setPlayerStorageValue(cid, 2010, 6)
		setPlayerStorageValue(cid, 2011, 0)

	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task') or msgcontains(msg, 'wolves')) and newhavenstep == 6 then
		if getPlayerStorageValue(cid, 2011) <=4 then
			npcHandler:say('You haven\'t killed 5 {wolves} yet. Come back when you have completed this {mission}.', cid)
		else
			npcHandler:say('Well done, here\'s some experience and gold for your efforts. Go and see Gus, he has a {mission} for you. I\'ve marked his position on your minimap for you.', cid)
			gusPos = {x=997, y=1046, z=7}
			doAddMapMark(cid, gusPos, 2, "Gus")
			doPlayerAddExp(cid,150) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 150 experience.") -- Show Exp
			doPlayerAddItem(cid, 2148, 100)
			setPlayerStorageValue(cid, 2010, 7)
		end
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 7 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 8 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 9 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 10 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 11 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 12 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 13 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 14 then
		npcHandler:say('I don\'t have any at the moment. Have you seen Gus yet? He was looking for you.', cid)
	elseif (msgcontains(msg, 'mission') or msgcontains(msg, 'task')) and newhavenstep == 15 then
		npcHandler:say('Gus has finished with you has he?', cid)
		setPlayerStorageValue(cid, 2010, 16)
	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'task') or msgcontains(msg, 'mission')) and newhavenstep == 16 then
		if getPlayerLevel(cid) <= 7 then
			npcHandler:say('You have come so far but you are not quite yet level 8. Go back into the wild and hunt some more monsters and come back to me when you are level 8.', cid)
		else
			npcHandler:say('You have done all you can for us here in New Haven. Leat me know when you are ready to {leave} and I\'ll send you to the oracle.', cid)
			setPlayerStorageValue(cid, 2010, 17)
		end
	elseif (msgcontains(msg, 'really bypass') and getPlayerLevel(cid) <= 7) then
		npcHandler:say('Choose your path wisely, and thank you for all your help. Good luck.', cid)
		doPlayerAddLevel(cid, 8 - getPlayerLevel(cid),true)
		doTeleportThing(cid,{x=1015, y=1018, z=6})
		setPlayerStorageValue(cid, 2010, 18)
	elseif (msgcontains(msg, 'bypass') and getPlayerLevel(cid) <= 7) then
		npcHandler:say('If you really want to skip New Haven then say {really bypass}. You will miss out on some benefits.', cid)
	elseif getPlayerLevel(cid) >= 8 and msgcontains(msg, 'leave') then
		npcHandler:say('Choose your path wisely, and thank you for all your help. Good luck.', cid)
		doTeleportThing(cid,{x=1015, y=1018, z=6})
		setPlayerStorageValue(cid, 2010, 18)
	end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
