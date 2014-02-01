local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg) 
	if(not npcHandler:isFocused(cid)) then  
		return false  
	end 
	local trade = { 
                  {id=7368, buy=100, sell=50, name="assassin star"}, 
                  }
	local items = {}  
		for _, item in ipairs(trade) do 
		items[item.id] = {storage = item.storage, item_id = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name} 
	end 

	local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)  
	    if items[item].buyPrice ~= 0 then  
	        doPlayerRemoveMoney(cid, amount * items[item].buyPrice)  
	        --for i = 1, amount do 
	            doPlayerAddItem(cid, items[item].item_id, amount)  
	        --end 
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
        if (playerOutfit.lookType == 156 or playerOutfit.lookType == 152) and playerOutfit.lookAddons == 3 then
            openShopWindow(cid, trade, onBuy, onSell) 
			npcHandler:say("Here's my offer.", cid) 
       else
            npcHandler:say("I only trade with fully equipped assassins.", cid)  
       end
    end
	if msgcontains(msg, 'addon') or msgcontains(msg, 'outfit') then
		npcHandler:say("Bring me 50 demon dusts, 50 vampire dusts and 10 spider silks and I'll perform the {ritual} that will grant you the assassin addons.", cid) 
	end
	if msgcontains(msg, 'ritual') then
		if getPlayerItemCount(cid, 5906) >=  50 and getPlayerItemCount(cid, 5905) >=  50 and getPlayerItemCount(cid, 5879) >=  10 then
			doPlayerRemoveItem(cid, 5906, 50)
			doPlayerRemoveItem(cid, 5905, 50)
			doPlayerRemoveItem(cid, 5879, 10)
			if getPlayerSex(cid) == 0 then
				npcHandler:say('<Performs ritual> Here are your assassin addons. Wear them with pride.', cid)
				doPlayerAddOutfit(cid,156,3) -- f
			else
				npcHandler:say('<Performs ritual> Here are your assassin addons. Wear them with pride.', cid)
				doPlayerAddOutfit(cid,152,3) -- m
			end
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			npcHandler:say("You do not have all the required items, come back when you do.", cid) 
		end
	end
	return 1
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())