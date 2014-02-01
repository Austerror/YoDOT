local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid) 				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function
	onThink()

	npcHandler:onThink()
end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	tutorialStep = getPlayerStorageValue(cid, 2003)

	if msgcontains(msg, 'mission') and tutorialStep == -1 then
		npcHandler:say('In the house behind me is a chest with some items you may find useful. Use the chest to get these items then come back to me and ask me about your {mission}.', cid)
		setPlayerStorageValue(cid,2003,1)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 1 then
		npcHandler:say('I\'ve already told you to retrieve the items from the chest in the house behind me, now get on with it.', cid)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 2 then
		npcHandler:say('I\'ve already told you to retrieve the items from the chest in the house behind me, now get on with it.', cid)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 3 then
		npcHandler:say('Ah good, a backpack with some equipment. If you haven\'t done so already, equip the backpack in you bag slot and hold Ctrl and left click it to open it. Inside you will find a rope and a shovel. Ask me for another {mission} when you are ready.', cid)
		setPlayerStorageValue(cid,2003,4)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 4 then
		npcHandler:say('See the stone pile next to my house? I want you to \'use\' your shovel on it to open it up. When you have done that, enter the hole and \'use\' the armor and weapon racks to receive some more equipment, then \'use\' the rope in your backpack on the \'rope spot\' to climb back out. After you have done this ask me about your {mission}.', cid)
		setPlayerStorageValue(cid,2003,5)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 5 then
		npcHandler:say('See the stone pile next to my house? I want you to \'use\' the shovel in your backpack to open that hole. When you have done that, enter the hole and \'use\' the armor and weapon racks to receive some more equipment, then \'use\' the rope in your backpack on the \'rope spot\' to climb back out. After you have done this ask me about your {mission}.', cid)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 6 then
		npcHandler:say('Well done! Did you notice that you gained enough experience to advance to level 2? You will earn experience towards more levels when you kill monsters or complete some quests. Now you should equip all the items if you haven\'t already. Once you have done this talk to me again about your {mission}.', cid)
		setPlayerStorageValue(cid,2003,7)
		return true
	elseif msgcontains(msg, 'mission') and tutorialStep == 7 then
		eqhelm = getPlayerSlotItem(cid, 1)
		eqarmor = getPlayerSlotItem(cid, 4)
		eqlegs = getPlayerSlotItem(cid, 7)
		eqboots = getPlayerSlotItem(cid, 8)
		eqweapon = getPlayerSlotItem(cid, 6)
		eqshield = getPlayerSlotItem(cid, 5)
		if eqhelm.itemid == 2482 and eqarmor.itemid == 2484 and eqlegs.itemid == 2468 and eqboots.itemid == 2643 and eqweapon.itemid == 2385 and eqshield.itemid == 2511 then
			npcHandler:say('Nicely fitted. I think you are now ready to {leave} my island.', cid)
			setPlayerStorageValue(cid,2003,8)
		else
			npcHandler:say('No, no, no. That will not do. Try it again. To equip your armor and weapons, drag them from your backpack to the correct slots for each item.', cid)
		end
		return true
	elseif msgcontains(msg, 'leave') and tutorialStep == 8 then
		npcHandler:say('Ask me for a {teleport} and I will send you to New Haven. When you arrive, seek out Jesse. I\'m sure he\'ll have a mission for you.', cid)
		setPlayerStorageValue(cid,2003,9)
		return true
	elseif msgcontains(msg, 'teleport') and tutorialStep == 9 then
		npcHandler:say('Good luck '.. getCreatureName(cid) ..'! Don\'t forget what you have learned here.', cid)
		setPlayerStorageValue(cid,2003,10)
		doPlayerSetTown(cid, 2)
		pos = getCreaturePosition(cid)
		doSendMagicEffect(pos, 10)
		doTeleportThing(cid,getPlayerMasterPos(cid))
		pos = getCreaturePosition(cid)
		doSendMagicEffect(pos, 10)
		-- Replace Quest rope and shovel if still in inv
		if getPlayerItemCount(cid,8711) >= 1 then
			doPlayerRemoveItem(cid,8711,getPlayerItemCount(cid,8711))
			doPlayerAddItem(cid,2554)
		end
		if getPlayerItemCount(cid,8712) >= 1 then
			doPlayerRemoveItem(cid,8712,getPlayerItemCount(cid,8712))
			doPlayerAddItem(cid,2120)
		end
			
		return true
	end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
