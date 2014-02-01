local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid) 				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink()						end
-- OTServ event handling functions end

local function doPromotion(cid)
taskCount = getPlayerStorageValue(cid, 2202)
if taskCount == 10 then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Congratulations! You have completed 10 tasks and received a demon backpack as a reward.")
	doPlayerAddItem(cid, 10518, 1) -- demon backpack
	doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
elseif taskCount == 25 then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Congratulations! You have completed 25 tasks and received a brown war horse mount as a reward.")
	doPlayerAddMount(cid, 17) -- War horse Mount
	doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
elseif taskCount == 50 then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Congratulations! You have completed 50 tasks and received a fire war horse mount as a reward.")
	doPlayerAddMount(cid, 23) -- Fire horse Mount
	doSendMagicEffect(getCreaturePosition(cid), 12) -- Magic effect on player to denote successful quest
end

end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local trade = { 
                  {id=5907, buy=34000, sell=0, name="slingshot"}, 
                  }
	local items = {}  
		for _, item in ipairs(trade) do 
		items[item.id] = {storage = item.storage, item_id = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name} 
	end 

	local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)  
	    if items[item].buyPrice ~= 0 then  
	        doPlayerRemoveMoney(cid, amount * items[item].buyPrice)  
			doPlayerAddItem(cid, items[item].item_id, amount)  
			npcHandler:say("You bought "..amount.." "..items[item].realName.." for "..items[item].sellPrice * amount.." gold coins.", cid)
	    end 
	end 
	    
	local onSell = function(cid, item, subType, amount, ignoreCap, inBackpacks)  
	    if items[item].sellPrice ~= 0 then  
	        doPlayerAddMoney(cid, items[item].sellPrice * amount)  
	        doPlayerRemoveItem(cid, items[item].item_id, amount)  
	        npcHandler:say("You sold "..amount.." "..items[item].realName.." for "..items[item].sellPrice * amount.." gold coins.", cid)  
        end 
    end 
    if msgcontains(msg, 'trade') or msgcontains(msg, 'offer') then  
		playerOutfit = getCreatureOutfit(cid)
        if getPlayerStorageValue(cid,2202) >= 50 then
            openShopWindow(cid, trade, onBuy, onSell) 
			npcHandler:say("Here's my offer.", cid) 
       else
            npcHandler:say("You need to complete 50 tasks before I will trade with you.", cid)  
       end
    end	
	
	
	taskNumber = getPlayerStorageValue(cid, 2200)
	killNumber = getPlayerStorageValue(cid, 2201)
	tasksCompleted = getPlayerStorageValue(cid, 2202)
	taskTalkStep = getPlayerStorageValue(cid, 2203)
	isBossKilled = getPlayerStorageValue(cid,2380)

	if msgcontains(msg, 'task') then
		npcHandler:say('I am a task master with tasks for everyone. If you are interested you can {start} one if you like. You can {hand in} your current task if you have finished it or {abandon} it if you can not.', cid)
	end
	if msgcontains(msg, 'abandon') and taskNumber >= 1 then
		npcHandler:say('Are you sure you want to abandon your current task?', cid)
		setPlayerStorageValue(cid,2203,100) -- Confirmed they want to abandon task
	elseif msgcontains(msg, 'start') and taskNumber <= 0 then
		if tasksCompleted == -1 then
			setPlayerStorageValue(cid,2202,0) -- Set tasks to 0 if 1st time.
		end
		if getPlayerLevel(cid) <= 20 then 
			npcHandler:say('I have the following tasks available for you: {rotworms} or {trolls}.', cid)
		elseif getPlayerLevel(cid) >= 21 and getPlayerLevel(cid) <= 50 then 
			npcHandler:say('I have the following tasks available for you: {apes}, {minotaurs} or {dragons}.', cid)
		elseif getPlayerLevel(cid) >= 51 and getPlayerLevel(cid) <= 80 then 
			npcHandler:say('I have the following tasks available for you: {mutants}, {bog raiders} or {crusaders}.', cid)
		elseif getPlayerLevel(cid) >= 81 and getPlayerLevel(cid) <= 120 then 
			npcHandler:say('I have the following tasks available for you: {crimson dragons} or {hydras}.', cid)
		elseif getPlayerLevel(cid) >= 121 and getPlayerLevel(cid) <= 150 then 
			npcHandler:say('I have the following tasks available for you: {demons} or {drakens}.', cid)
		elseif getPlayerLevel(cid) >= 151 then 
			npcHandler:say('I have the following tasks available for you: {demons}, {drakens}, {crimson dragons}, {hydras}, {mutants}, {bog raiders} or {crusaders}.', cid)
		end
	elseif msgcontains(msg, 'start') and taskNumber >= 1 then
		npcHandler:say('You\'re already on a task, you can {hand in} if you have finished, or {abandon} if you can\'t.', cid)
	elseif msgcontains(msg, 'hand in') and taskNumber >=1 then
		npcHandler:say('Which task are you handing in?', cid)
	elseif msgcontains(msg, 'hand in') and taskNumber <=0 then
		npcHandler:say('You\'re not on a task, you have to {start} one.', cid)
		
	elseif msgcontains(msg, 'rotworm') then
		if taskNumber <= 0 and getPlayerLevel(cid) <= 20 then
			npcHandler:say('Do you want to kill 100 rotworms for me?', cid)
			setPlayerStorageValue(cid,2203,1) -- Asked if they will kill 100 rotworms
		elseif taskNumber == 1 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 rotworms yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 1 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Lump and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,1) -- Rotworm boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 1 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Lump yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 1 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,5000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 500 gold and 5000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 5) -- Give 5 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'troll') then
		if taskNumber <= 0 and getPlayerLevel(cid) <= 20 then
			npcHandler:say('Do you want to kill 100 trolls for me?', cid)
			setPlayerStorageValue(cid,2203,2) -- Asked if they will kill 100 trolls
		elseif taskNumber == 2 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 trolls yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 2 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Glorgor and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,2) -- Troll boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 2 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Glorgor yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 2 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,5000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 500 gold and 5000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 5) -- Give 5 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'dragons') then
		if taskNumber <= 0 and (getPlayerLevel(cid) >= 21 and getPlayerLevel(cid) <= 50) then
			npcHandler:say('Do you want to kill 100 dragons for me?', cid)
			setPlayerStorageValue(cid,2203,3) -- Asked if they will kill 100 tarantulas
		elseif taskNumber == 3 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 dragons yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 3 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Puff and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,4) -- Dragon boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 3 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Puff yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 3 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,25000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 1000 gold and 25000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 10) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'minotaur') then
		if taskNumber <= 0 and (getPlayerLevel(cid) >= 21 and getPlayerLevel(cid) <= 50) then
			npcHandler:say('Do you want to kill 100 minotaurs for me?', cid)
			setPlayerStorageValue(cid,2203,5) -- Asked if they will kill 100 minotaurs
		elseif taskNumber == 5 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 minotaurs yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 5 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Udder and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,5) -- Mino boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 5 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Udder yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 5 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,25000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 1000 gold and 25000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 10) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'ape') then
		if taskNumber <= 0 and (getPlayerLevel(cid) >= 21 and getPlayerLevel(cid) <= 50) then
			npcHandler:say('Do you want to kill 100 apes for me?', cid)
			setPlayerStorageValue(cid,2203,6) -- Asked if they will kill 100 apes
		elseif taskNumber == 6 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 apes yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 6 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Scat Fu and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,3) -- Ape boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 6 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Scat Fu yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 6 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,25000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 1000 gold and 25000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 10) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'mutant') or msgcontains(msg, 'mutated') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 51 and getPlayerLevel(cid) <= 80) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 mutants for me?', cid)
			setPlayerStorageValue(cid,2203,7) -- Asked if they will kill 100 mutated rats
		elseif taskNumber == 7 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 mutants yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 7 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Esmeralda and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,6) -- mutant boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 7 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Esmeralda yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 7 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,50000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 5000 gold and 50000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 50) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
		
	elseif msgcontains(msg, 'bog raider') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 51 and getPlayerLevel(cid) <= 80) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 bog raiders for me?', cid)
			setPlayerStorageValue(cid,2203,12) -- Asked if they will kill 100 bog raiders
		elseif taskNumber == 12 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 bog raiders yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 12 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Essbend and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,12) -- mutant boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 12 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Essbend yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 12 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,50000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 5000 gold and 50000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 50) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end		
		
	elseif msgcontains(msg, 'crusader') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 51 and getPlayerLevel(cid) <= 80) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 crusaders for me?', cid)
			setPlayerStorageValue(cid,2203,8) -- Asked if they will kill 100 crusaders
		elseif taskNumber == 8 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 crusaders yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 8 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Grohl and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,8) -- Crusader boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 8 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Grohl yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 8 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,50000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 5000 gold and 50000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 50) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'crimson dragon') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 81 and getPlayerLevel(cid) <= 120) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 crimson dragons for me?', cid)
			setPlayerStorageValue(cid,2203,4) -- Asked if they will kill 100 crimson dragons
		elseif taskNumber == 4 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 crimson dragons yet. Ask me about them again when you have or {abandon} this task.', cid)		
		elseif taskNumber == 4 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Barney and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,7) -- dl boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 4 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Barney yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 4 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,75000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 7500 gold and 75000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 75) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'hydra') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 81 and getPlayerLevel(cid) <= 120) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 hydras for me?', cid)
			setPlayerStorageValue(cid,2203,9) -- Asked if they will kill 100 hydras
		elseif taskNumber == 9 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 hydras yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 9 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call The Many and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,9) -- Hydra boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 9 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed The Many yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 9 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,75000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 7500 gold and 75000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2152, 75) -- Give 10 Platinum Coins
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'demon') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 121 and getPlayerLevel(cid) <= 150) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 demons for me?', cid)
			setPlayerStorageValue(cid,2203,10) -- Asked if they will kill 100 demons
		elseif taskNumber == 10 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 demons yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 10 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Thunderstorm and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,10) -- Demon boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 10 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Thunderstorm yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 10 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,100000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 gold and 100000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2160, 1) -- Give 1 Crystal Coin
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
		elseif msgcontains(msg, 'draken') then
		if taskNumber <= 0 and ((getPlayerLevel(cid) >= 121 and getPlayerLevel(cid) <= 150) or getPlayerLevel(cid) >= 151) then
			npcHandler:say('Do you want to kill 100 drakens for me?', cid)
			setPlayerStorageValue(cid,2203,11) -- Asked if they will kill 100 drakens
		elseif taskNumber == 11 and killNumber <=99 then
			npcHandler:say('You haven\'t killed 100 drakens yet. Ask me about them again when you have or {abandon} this task.', cid)
		elseif taskNumber == 11 and killNumber >=100 and isBossKilled <= 0 then			
			npcHandler:say('Good work, now kill the one they call Drek Thar and return to me when you have.', cid)
			setPlayerStorageValue(cid,2381,11) -- Demon boss
			setPlayerStorageValue(cid,2380,1) -- To do boss
		elseif taskNumber == 11 and killNumber >=100 and isBossKilled == 1 then			
			npcHandler:say('You haven\'t killed Drek Thar yet. Return to me when you have or {abandon} this task.', cid)
		elseif taskNumber == 11 and killNumber >=100 and isBossKilled == 2 then
			npcHandler:say('Nice work, here\'s your reward. You can {start} another task when you\'re ready.', cid)
			doPlayerAddExp(cid,100000) -- give Exp
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You earned 10000 gold and 100000 experience.") -- Show Gold & Exp
			doPlayerAddItem(cid, 2160, 1) -- Give 1 Crystal Coin
			setPlayerStorageValue(cid,2200,0) -- Reset task number to 0
			setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
			setPlayerStorageValue(cid,2202,(tasksCompleted + 1)) -- Add 1 to tasks completed
			setPlayerStorageValue(cid,2381,0) -- Reset Boss to 0
			setPlayerStorageValue(cid,2380,0) -- reset has killed boss to 0
			doPromotion(cid)
		else
			npcHandler:say('You\'re not on this task.', cid)
		end
	elseif msgcontains(msg, 'yes') and taskTalkStep == 1 then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task. You can find rotworms in the city sewers, I have marked the sewer entrance on your minimap.', cid)
		sewerPos = {x=1077, y=1062, z=7}
		doAddMapMark(cid, sewerPos, 19, "Sewers")
		setPlayerStorageValue(cid,2200,1)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and taskTalkStep == 2 then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task.  You can find swamp trolls in the city sewers, I have marked the sewer entrance on your minimap.', cid)
		sewerPos = {x=1077, y=1062, z=7}
		doAddMapMark(cid, sewerPos, 19, "Sewers")
		setPlayerStorageValue(cid,2200,2)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and (taskTalkStep >= 3 and taskTalkStep <= 8) then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task.', cid)
		setPlayerStorageValue(cid,2200,taskTalkStep)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and taskTalkStep == 9 then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task. You can also use the portal upstairs to get to hydras, and also use the portal at hydras to return.', cid)
		setPlayerStorageValue(cid,2200,9)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2420,1) -- Give access to hydra portals
		setPlayerStorageValue(cid,2612,1) -- Give access to bog portals
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and taskTalkStep == 10 then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task.', cid)
		setPlayerStorageValue(cid,2200,10)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2420,1) -- Give access to hydra portals
		setPlayerStorageValue(cid,2612,1) -- Give access to bog portals
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and taskTalkStep == 11 then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task.', cid)
		setPlayerStorageValue(cid,2200,11)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2420,1) -- Give access to hydra portals
		setPlayerStorageValue(cid,2612,1) -- Give access to bog portals
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and taskTalkStep == 12 then
		npcHandler:say('Good. Off you go and report back to me when you have killed 100 of them. You can check your quest log at any time to see what task you are on and how many you have killed for that task. You can also use the portal upstairs to get to bog raiders, and also use the portal at bog raiders to return.', cid)
		setPlayerStorageValue(cid,2200,12)
		setPlayerStorageValue(cid,2203,0)
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2612,1) -- Give access to bog portals
		setPlayerStorageValue(cid,2380, -1)
	elseif msgcontains(msg, 'yes') and taskTalkStep == 100 then -- Abandoning Task
		npcHandler:say('Sure thing, I have taken your name off that list, just ask me for a {task} when you want to start a new one.', cid)
		setPlayerStorageValue(cid,2200,0) -- Reset Task to 0
		setPlayerStorageValue(cid,2203,0) -- Talkstate to 0
		setPlayerStorageValue(cid,2201,0) -- Reset kills to 0
		setPlayerStorageValue(cid,2380, -1)
	elseif not msgcontains(msg, 'yes') and taskTalkStep == 100 then -- Abandoning Task
		npcHandler:say('Perhaps it is best you didn\'t.', cid)
		setPlayerStorageValue(cid,2203,0) -- Talkstate to 0
	end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
